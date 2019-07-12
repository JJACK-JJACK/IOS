//
//  EditNicknameVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 02/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class EditNicknameVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var edittingNiknm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edittingNiknm.text = paramName
        self.edittingNiknm.delegate = self
    }
    
    var paramName: String = " "
    var isDuplicate: Bool = false
    
    
    @IBAction func deleteTxt(_ sender: Any) {
        self.edittingNiknm.text? = ""
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 닉네임 중복 검사
    @IBAction func checkDuplicate(_ sender: Any) {
        guard let nickname = edittingNiknm.text else {return}
        AuthServices.shared.checkDuplicate(nickname) {
            (data) in
            switch data {
            case .success(let validate):
                self.simpleAlert(title: "성공", message: "사용가능한 닉네임 입니다.")
                let pass: Bool = (validate as? Bool)!
                self.isDuplicate = pass
                print(pass)
                break
            case .requestErr(let message):
                print(message)
                self.simpleAlert(title: "실패", message: (message as? String)!)
                break
            case .pathErr:
                break
            case .serverErr:
                break
            case .networkFail:
                break
            }
        }
        
    }
    
    // 닉네임 수정
    @IBAction func confirmEditName (_ sender: Any) {

        print(isDuplicate)
        if isDuplicate {
            guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
            print(token)
            guard let nickname = edittingNiknm.text else {return}
            print(nickname)
            MyPageService.shared.EditNickname(token, nickname){
                [weak self]
                (data) in
                guard let `self` = self else {return}
                print("여기인가?")

                switch data {
                case .success(let message):
                    print(message)
                    UserDefaults.standard.set(nickname, forKey: "nickname")
                    self.dismiss(animated: true, completion: nil)
                    break
                case .requestErr(let message):
                    print(message)
                    break
                case .pathErr:
                    print("path")
                    break
                case .serverErr:
                    print("server")
                    break
                case .networkFail:
                    print("network")
                    break
                }
            }
        }else {
            self.simpleAlert(title: "중복 확인을 해주세요.", message: "")
        }
        
    }
    
}
