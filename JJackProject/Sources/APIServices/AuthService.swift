//
//  AuthService.swift
//  JJackProject
//
//  Created by SangIl Mo on 07/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire

struct AuthServices: APIManager {
    
    static let shared = AuthServices()
    let BaseUrl = url("/user")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    func login (_ email: String, _ pw: String, complition: @escaping (NetworkResult<Any>) -> Void) {
        
        let body: Parameters = [
            "email" : email,
            "password" : pw
        ]
        
        let URL = BaseUrl + "/signin"
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                switch res.result {
                case .success:
                    if let value = res.result.value {
                        if let status = res.response?.statusCode {
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(Token.self, from: value)
                                    switch result.success{
                                    case true:
                                        print("\(result.status)")
                                        complition(.success(result.data!))
                                    case false:
                                        complition(.requestErr(result.message))
                                    }
                                } catch {
                                    print("error")
                                }
                            case 400:
                                print(status)
                                complition(.pathErr)
                            case 500:
                                print(status)
                                print("-------------------------------")
                                print(status)
                                complition(.serverErr)
                            default:
                                print("-------------------------------")
                                print(status)
                                break
                            }
                        }
                    }
                    break
                    
                case .failure(let err):
                    print(URL)
                    print(err.localizedDescription)
                    print(res.result)
                    complition(.networkFail)
                    break
                }
            
        }
    }
    
}
