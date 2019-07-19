//
//  RankingService.swift
//  JJackProject
//
//  Created by SangIl Mo on 10/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire

struct RankingService: APIManager {
    static let shared = RankingService()
    let BaseUrl = url("/ranking")
    
    func getRanking (completion: @escaping (NetworkResult<Any>) -> Void) {
        
        Alamofire.request(BaseUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData{ res in
                print("----------------- Show Top 10 Review ------------------")
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status = res.response?.statusCode{
                            print("status: \(status)")
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(ResponseArr<Datum>.self, from: value)
                                    print("Reques: \(result.success)")
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
