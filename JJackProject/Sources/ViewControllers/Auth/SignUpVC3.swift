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
        
        nameTF.delegate = self
        pwCheckTF.delegate = self
    
        setupNotification()
    }
    
    var paramPw: String = ""

    
    @IBAction func completeSignup(_ sender: UIButton) {
        guard let pw = pwCheckTF.text else {return}
        guard let nickName = nameTF.text else {return}
        
        if pw == self.paramPw{
            // 통신
            performSegue(withIdentifier: "unwindToMain", sender: self)
        } else {
            simpleAlert(title: "실패", message: "비밀번호가 일치 하지 않습니다.")
        }
        
    }
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
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
        //        self.Login.transform = CGAffineTransform(translationX: 0, y: -30)
        //        self.toSignup.transform = CGAffineTransform(translationX: 0, y: -30)
        self.nextBtn.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.cgRectValue.height + control.constant - 10)
        self.view.transform = CGAffineTransform(translationX: 0 , y: -20)
        //        self.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        //        self.view.frame.origin.y = -100
    }
    @objc func keyboardWillHide (_ sender: Notification) {
        //        self.Login.transform = .identity
        //        self.toSignup.transform = .identity
        self.nextBtn.transform = .identity
        self.view.transform = .identity
    }
}
