//
//  MyPageService.swift
//  JJackProject
//
//  Created by SangIl Mo on 12/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import Alamofire

struct MyPageService: APIManager {

    static let shared = MyPageService()
    let BaseUrl = url("/mypage")
    
    func EditNickname (_ token: String, _ nickname: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = BaseUrl + "/nickname"
        let headers: HTTPHeaders = [
            "Content-type" : "application/json",
            "token" : token
        ]
        let body: Parameters = [
            "nickname" : nickname
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers:    headers)
            .responseData{
                res in
                print("----------------- Edit NickName ------------------")
                res.result.ifSuccess {
                    if let value = res.result.value{
                        if let status =
                            res.response?.statusCode{
                            print("status: \(status)")
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(ResponseStr.self, from: value)
                                    print("Request: \(result.success)")
                                    if result.success
                                    { completion(.success(result.message)) }
                                    else
                                    { completion(.requestErr(result.message)) }
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
