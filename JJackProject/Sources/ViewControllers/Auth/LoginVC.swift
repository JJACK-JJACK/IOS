//
//  SignUpVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var underBarView: UIView!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var toSignup: UIButton!
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        setupNotification()
        idTF.delegate = self
        pwTF.delegate = self
    }
    func setBorderRadius() {
        Login.makeRounded(cornerRadius: 4.0)
        toSignup.makeRounded(cornerRadius: 4.0)
    }
    func setBorderColor() {
        toSignup.setBorder(borderColor: nil, borderWidth: 1.0)
    }
    func setup(){
        setBorderRadius()
        setBorderColor()
    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Login(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "HomeMain", bundle: nil).instantiateViewController(withIdentifier: "Home")as? HomeVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func unwindToMain (segue: UIStoryboardSegue) {
    }
   
}
extension LoginVC: UITextFieldDelegate {
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:  UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:  UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        idTF.resignFirstResponder()
        pwTF.resignFirstResponder()
        return true
    }
    @objc func keyboardWillShow (_ sender: Notification) {
//        guard let userInfo = sender.userInfo as? [String:Any] else {return}
//        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//        self.Login.transform = CGAffineTransform(translationX: 0, y: -30)
//        self.toSignup.transform = CGAffineTransform(translationX: 0, y: -30)
        self.view.transform = CGAffineTransform(translationX: 0, y:  -40)
        //        self.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        //        self.view.frame.origin.y = -100
    }
    @objc func keyboardWillHide (_ sender: Notification) {
//        self.Login.transform = .identity
//        self.toSignup.transform = .identity
        self.view.transform = .identity
    }
}
