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
    func login (_ email: String, _ pw: String, completion: @escaping (NetworkResult<Any>) -> Void) {

        let body: Parameters = [
            "email" : email,
            "password" : pw
        ]

        let URL = BaseUrl + "/signin"
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                print("----------------- Login ------------------")
                print("통신 이후 정보를 담아아오는 completion의 변수 res: \(res)")
                switch res.result {
                case .success:
                    // value는 data의 바이트 값을 나타낸다. -> 토큰의 정보가 되나?
                    if let value = res.result.value {
                        print("담아온 정보를 걸러주는 프로퍼티 .value: \(value)")
                        if let status = res.response?.statusCode {
                            print("통신 결과에 따른 값 들을 서버에서 REST DESIGN에 의해 보내는 값 Status Code: \(status)")
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    // json Data를 데이터로 다시 decoding 시도!
                                    let result = try decoder.decode(ResponseObj<Token>.self, from: value)
                                    print("제공 서비스 요청 성공 여부: \(result.success)")
                                    switch result.success{
                                    case true:
                                        completion(.success(result.data!))
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                } catch {
                                    print("error")
                                }
                            case 400:
                                print(status)
                                completion(.pathErr)
                            case 500:
                                print(status)
                                completion(.serverErr)
                            default:
                                break
                            }
                        }
                    }
                    break

                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                }

        }
    }
    
    func signup (_ email: String, _ pw: String, _ name: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let body: Parameters = [
            "email" : email,
            "password" : pw,
            "nickname" : name
        ]
        
        let URL = BaseUrl + "/signup"
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseData{ res in
                // 메서드 사용해서 코드 줄여 보기
                //if 로 바꿔 보자
                print("----------------- Signup ------------------")
                switch res.result{
                case .success:
                    if let value = res.result.value{
                        if let status = res.response?.statusCode {
                            print("status: \(status)")
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    let result = try
                                        decoder.decode(ResponseStr.self, from: value)
                                    // if 로 바꾸자
                                    print("Request \(result.success)")
                                    switch result.success{
                                    case true:
                                        print("\(result.status)")
                                        //result 는 서버에서 전달하는 객체들의 결과를 말한다! 그래서 총 4가지!!!

                                        completion(.success(result.message))
                                    case false:
                                        // result.data 는 토큰이라는 data를 보내주지만 회원가입에서는 message를 보낸다는 것을 기억하자!

                                        completion(.requestErr(result.status))
                                    }
                                } catch {print("error")}
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }
                        }
                    }
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                }
                
        }
    }
    
    func checkDuplicate (_ nickname: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let body: Parameters = [
            "nickname" : nickname
        ]
        
        let URL = BaseUrl + "/nickname"
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData{ res in
            
            print("----------------- Check Duplication NickName ------------------")
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let status = res.response?.statusCode {
                        print("status: \(status)")
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                 // 서버에서 전달해주는 값들을 받는 역할
                                let result = try
                                    decoder.decode(ResponseStr.self, from: value)
                                // if 로 바꾸자
                                print("Request \(result.success)")
                                switch result.success{
                                case true:
                                    //result 는 서버에서 전달하는 객체들의 결과를 말한다! 그래서 총 4가지!!!
                                    completion(.success(result.success))
                                case false:
                                    completion(.requestErr(result.message))
                                }
                            } catch {print("error")}
                        case 400:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }
                    }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
    
}
