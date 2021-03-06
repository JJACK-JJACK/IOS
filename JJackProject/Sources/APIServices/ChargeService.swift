//
//  ChargeService.swift
//  JJackProject
//
//  Created by SangIl Mo on 10/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire

struct ChargeService: APIManager {
    
    static let shared = ChargeService()
    
    let BaseUrl = url("/berryHistory")
    
    func chargingBerry (_ token: String, _ berry: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = BaseUrl
        
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        let body: Parameters = [
            "chargeBerry" : berry
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                print("----------------- Charge Berry ------------------")
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status = res.response?.statusCode{
                            print("status: \(status)")
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(ResponseObj<Charge>.self, from: value)
                                    print("Request: \(result.success)")
                                    if result.success {completion(.success(result.data!))}
                                    else { completion(.requestErr(result.message))}
                                } catch {print("error")}
                            case 400:
                                print("pathErr")
                                completion(.pathErr)
                            case 500:
                                print("serverErr")
                                completion(.serverErr)
                            default:
                                break
                            }
                        }
                    }
                }
                res.result.ifFailure {
                    print(URL)
                    let err = res.result.error!
                    print(err.localizedDescription)
                    completion(.networkFail)
                }
        }
    }
    
    func ownedBerry(_ token: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = BaseUrl + "/myBerry"
        
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                print("----------------- My Own Berry ------------------")
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status = res.response?.statusCode{
                            print("status: \(status)")
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(MyBerry.self, from: value)
                                    print("Request: \(result.success)")
                                    if result.success {completion(.success(result.data))}
                                    else { completion(.requestErr(result.message))}
                                } catch {print("error")}
                            case 400:
                                print("pathErr")
                                completion(.pathErr)
                            case 500:
                                print("serverErr")
                                completion(.serverErr)
                            default:
                                break
                            }
                        }
                    }
                }
                res.result.ifFailure {
                    print(URL)
                    let err = res.result.error!
                    print(err.localizedDescription)
                    completion(.networkFail)
                }
        }
    }
}
