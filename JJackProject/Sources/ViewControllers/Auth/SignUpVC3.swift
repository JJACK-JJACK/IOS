//
//  SignUpVC3.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SignUpVC3: UIViewController {

    @IBOutlet weak var checkDuplicate: UIButton!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var pwCheckTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var control: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.checkDuplicate.setBorder(borderColor: UIColor(white: 221.0 / 255.0, alpha: 1.0), borderWidth: 1.0)
        self.checkDuplicate.makeRounded(cornerRadius: 8.0)
        self.nextBtn.setBorder(borderColor: .pointCol, borderWidth: 4.0)
        self.nextBtn.makeRounded(cornerRadius: 8.0)
        
        nameTF.delegate = self
        pwCheckTF.delegate = self
    
        setupNotification()
    }
    
    var paramEmail: String = ""
    var paramPw: String = ""
    var duplicate: Bool = false

    // 닉네임 중복 검사
    @IBAction func checkDupl(_ sender: Any) {
        guard let nickname = nameTF.text else {return}
        
        AuthServices.shared.checkDuplicate(nickname) {
            (data) in
            switch data {
            case .success(let validate):
                self.simpleAlert(title: "성공", message: "사용가능한 닉네임 입니다.")
                let pass: Bool = (validate as? Bool)!
                self.duplicate = pass
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
    
    // 회원가입 통신 / 확인!
    @IBAction func completeSignup(_ sender: UIButton) {
        guard let pw = pwCheckTF.text else {return}
        guard let nickName = nameTF.text else {return}
        
        if pw == self.paramPw && duplicate{
            AuthServices.shared.signup(paramEmail, pw, nickName) {
                (data) in
                switch data {
                case .success(let message):
                    print(message)
                        UserDefaults.standard.set(true, forKey: "didSignup")
                    UserDefaults.standard.set(self.paramEmail, forKey: "email")
                    break
                case .requestErr(let status):
                    switch status as? Int {
                    case 400:
                        print("이미 회원입니다.")
                    case 600:
                        print("회원 등록 실패 / DB에러")
                    case .none:
                        print("값없음")
                    case .some(_):
                        print("띠용")
                    }
                    break
                case .pathErr:
                    break
                case .serverErr:
                    break
                case .networkFail:
                    break
                }
            }
            // 돌아가기
            performSegue(withIdentifier: "unwindToMain", sender: self)
        } else if pw != self.paramPw{
            // 닉네임 중복시랑, 패스워드 불일치 - 2가지 예외처리 필요!
            simpleAlert(title: "실패", message: "비밀번호가 일치 하지 않습니다.")
        }else {simpleAlert(title: "실패", message: "중복확인 혹은 다른 닉네임을 사용해주세요.")}
        
    }
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
// KeyBoard Action
extension SignUpVC3: UITextFieldDelegate {
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:  UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:  UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        pwCheckTF.resignFirstResponder()
        return true
    }
    @objc func keyboardWillShow (_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String:Any] else {return}
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        self.nextBtn.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.cgRectValue.height + control.constant - 10)
        self.view.transform = CGAffineTransform(translationX: 0 , y: -20)
    }
    @objc func keyboardWillHide (_ sender: Notification) {
        self.nextBtn.transform = .identity
        self.view.transform = .identity
    }
}
