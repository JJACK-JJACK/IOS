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
        
        idTF.text = "ios@jjack.com"
        pwTF.text = "ios"
    }
    // setting Views
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
        guard let id = idTF.text else {return}
        guard let pw = pwTF.text else {return}

        if id.Validate(){
            AuthServices.shared.login(id, pw) {
                (data) in
                switch data {
                case .success(let token):
                    // 보관 , 덮어쓰기 , 파기 -> 키 : 벨류 로 저장
                    // UserDefaults를 사용할 때에는 객체를 담는 것이 아니라 객체의 정보를 담아야 함으로 형변환이 필요하다.
                    
/*A default object must be a property list—that is, an instance of (or for collections, a combination of instances of) NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary. If you want to store any other type of object, you should typically archive it to create an instance of NSData. */

                    guard let token = token as? Token else {return}
                    print(token)
                    UserDefaults.standard.set(token.token, forKey: "refreshToken")
                    print(token.nickname); UserDefaults.standard.set(token.nickname, forKey: "nickname")
                    print(id)
                    UserDefaults.standard.set(id, forKey: "email")
                    print(token.nickname)
                    print(id)
                    print(pw)
                    guard let dvc = UIStoryboard(name: "HomeMain", bundle: nil).instantiateViewController(withIdentifier: "Home")as? HomeVC else {return}
                    self.navigationController?.pushViewController(dvc, animated: true)
                    break
                case .requestErr(let err):
                    guard let err = err as? String else {return}
                    self.simpleAlert(title: "로그인 실패", message: err)
                    break
                case .pathErr:
                    // 대체로 경로를 잘못 쓴 경우입니다.
                    // 오타를 확인해보세요.
                    print("경로 에러")
                    break
                case .serverErr:
                    // 서버의 문제인 경우입니다.
                    // 여기에서 동작할 행동을 정의해주시면 됩니다.
                    print("서버 에러")
                    break
                case .networkFail:
                    // 이 경우엔 reachability 를 이용해서 현재 네트워크 상태를 검사하고
                    // 앱을 종료시키거나 메시지를 표시하면 됩니다.
                    // reachability 에 대해서 구글링해보세요!
                    print(id)
                    print(pw)
                    print("네트워크 에러")
                    break
                }
            }
        } else{
            simpleAlert(title: "실패", message: "이메일 형식이 올바르지 않습니다.")
        }
        
        
    }
    
   
}
extension LoginVC: UITextFieldDelegate {
    
    //Keyboard show Notification!
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:  UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:  UIResponder.keyboardWillHideNotification , object: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        idTF.resignFirstResponder()
        pwTF.resignFirstResponder()
        return true
    }
    // 키보드 발생시 함수
    @objc func keyboardWillShow (_ sender: Notification) {

        self.view.transform = CGAffineTransform(translationX: 0, y:  -40)
            }
    @objc func keyboardWillHide (_ sender: Notification) {
//        self.Login.transform = .identity
//        self.toSignup.transform = .identity
        self.view.transform = .identity
    }
}
