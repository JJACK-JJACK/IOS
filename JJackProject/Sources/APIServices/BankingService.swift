//
//  MyPageService.swift
//  JJackProject
//
//  Created by SangIl Mo on 10/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire

struct BankingService: APIManager {
    
    static let shared = BankingService()
    let BaseUrl = url("/banking")
    
    func getBanking (_ token: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = BaseUrl
        
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status =
                                res.response?.statusCode{
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                    decoder.decode(ResponseObj<Banking>.self, from: value)
                                    if result.success
                                    {completion(.success(result.data!))}
                                    else
                                    {completion(.requestErr(result.message))}
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
