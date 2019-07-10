//
//  StampService.swift
//  JJackProject
//
//  Created by SangIl Mo on 11/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire
struct StampServices: APIManager {
    
    static let shared = StampServices()
    let BaseUrl = url("/stamp")
    
    func getStamp(_ token: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        
        Alamofire.request(BaseUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status = res.response?.statusCode{
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(ResponseArr<Datum>.self, from: value)
                                    print(result)
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
                    let err = res.result.error!
                    print(err.localizedDescription)
                    completion(.networkFail)
                }

        }
    }
}
