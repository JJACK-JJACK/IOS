//
//  History.swift
//  JJackProject
//
//  Created by SangIl Mo on 09/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire

struct HistoryService: APIManager{
    static let shared = HistoryService()
    let BaseUrl = url("")
    
    func getMyHistory (_ token: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = BaseUrl + "/donate"
        
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status = res.response?.statusCode{
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(ResponseObj<MyHistory>.self, from: value)
                                    if result.success {
                                        print(result.success)
                                        print("성공")
                                        completion(.success(result.data!))}
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
    
    func getDonatedList (_ token: String, completion: @escaping (NetworkResult<Any>) -> Void ) {
        
        let URL = BaseUrl + "/history"
        
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil , encoding: JSONEncoding.default, headers: headers).responseData{ res in
            
            res.result.ifSuccess {
                if let value = res.result.value{
                    if let status = res.response?.statusCode{
                        switch status {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let result = try
                                    decoder.decode(ResponseArr<HistoryList>.self, from: value)
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
    
    func getEachDonatedBerry (_ token: String, completion: @escaping (NetworkResult<Any>) -> Void ) {
        
        let URL = BaseUrl + "/history/berry"
        
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil , encoding: JSONEncoding.default, headers: headers).responseData{ res in
            
            res.result.ifSuccess {
                if let value = res.result.value{
                    if let status = res.response?.statusCode{
                        switch status {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let result = try
                                    decoder.decode(ResponseArr<MyEachDonatedBerry>.self, from: value)
                                print(result)
                                if result.success
                                    {
                                       print("성공")
                                    completion(.success(result.data!))}
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
