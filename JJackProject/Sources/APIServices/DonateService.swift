//
//  DonateService.swift
//  JJackProject
//
//  Created by SangIl Mo on 09/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire

struct DonateService: APIManager {
    
    static let shared = DonateService()
    let BaseUrl = url("/userHistory")
    
    func donate (_ token: String, _ berry: Int,_ programId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = BaseUrl + "/\(programId)"
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "token" : token
        ]
        let body: Parameters = [
            "donateBerry" : berry
        ]
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status = res.response?.statusCode{
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(ResponseArr<Donate>.self, from: value)
                                    if result.success {completion(.success(result.message))}
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
