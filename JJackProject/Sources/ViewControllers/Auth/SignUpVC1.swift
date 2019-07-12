//
//  SignUpVC1.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SignUpVC1: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var control: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.emailTF.delegate = self
        self.nextBtn.setBorder(borderColor: .pointCol, borderWidth: 4.0)
        setupNotification()
        
    }

    @IBAction func goNext(_ sender: Any) {
        guard let email = emailTF.text else {return}
        if email.Validate() {
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SettingPwd") as? SignUpVC2 else { return }
            
            // email 문자열 전달
            
            dvc.paramEmail = email
            navigationController?.pushViewController(dvc, animated: true)
        }else {
            simpleAlert(title: "이메일 형식이 잘못 되었습니다.", message: "")
        }
       
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
}
extension SignUpVC1: UITextFieldDelegate {
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:  UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:  UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTF.resignFirstResponder()
        return true
    }
    @objc func keyboardWillShow (_ sender: Notification) {
                guard let userInfo = sender.userInfo as? [String:Any] else {return}
                guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        //        self.Login.transform = CGAffineTransform(translationX: 0, y: -30)
        //        self.toSignup.transform = CGAffineTransform(translationX: 0, y: -30)
        self.nextBtn.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.cgRectValue.height + control.constant - 10)
        //        self.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        //        self.view.frame.origin.y = -100
    }
    @objc func keyboardWillHide (_ sender: Notification) {
        //        self.Login.transform = .identity
        //        self.toSignup.transform = .identity
        self.nextBtn.transform = .identity
    }
}
