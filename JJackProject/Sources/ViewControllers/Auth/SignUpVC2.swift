//
//  SignUpVC2.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SignUpVC2: UIViewController {

    @IBOutlet weak var pwTF: UITextField!
    @IBOutlet weak var pwCheckTF: UITextField!
    @IBOutlet weak var control: NSLayoutConstraint!
    
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pwTF.delegate = self
        self.pwCheckTF.delegate = self
        
        setupNotification()
        
        self.nextBtn.setBorder(borderColor: .pointCol, borderWidth: 4.0)
        self.nextBtn.makeRounded(cornerRadius: 8.0)
        print(paramEmail)
    }
    
    var paramEmail: String = ""

    @IBAction func goNext(_ sender: Any) {
        guard let pw = pwTF.text else {return}
        guard let pwCheck = pwCheckTF.text else {return}
        if pw == pwCheck {
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SettingNickname")as? SignUpVC3 else {return}
            // password 전달!
            dvc.paramEmail = paramEmail
            dvc.paramPw = pw
            navigationController?.pushViewController(dvc, animated: true)
        }else {
            simpleAlert(title: "비밀번호가 일치하지 않습니다.", message: "")
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension SignUpVC2: UITextFieldDelegate {
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:  UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:  UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pwTF.resignFirstResponder()
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
