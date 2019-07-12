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
    @IBAction func confirmEditName (_ sender: Any) {
//        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "EditAccoutVC") as? EditAccoutVC else { return }
        
//        guard let text = edittingNiknm.text else { return }
        
//        dvc.name = self.edittingNiknm.text!
//
//        present(dvc, animated: true, completion: nil)
        
        /* 값 전달이 아니라 서버와 요청이 필요합니다.
            서버 요청으로 값을 page View 에서 바꿔서 수정하는 부분으로 해야 할듯 함*/
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
        }
        
    }
    
}
