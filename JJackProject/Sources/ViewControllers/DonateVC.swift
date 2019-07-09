//
//  DonateVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DonateVC: UIViewController {

    @IBOutlet weak var charging10: UIButton!
    @IBOutlet weak var charging20: UIButton!
    @IBOutlet weak var charging50: UIButton!
    @IBOutlet weak var chargingAll: UIButton!
    
    @IBOutlet weak var berryValue: UITextField!
    
    @IBOutlet weak var confirmDonate: UIButton!
    
    var paramId: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    func setup() {
        setBorder()
        roundBorder()
    }
    func setBorder () {
        charging10.setBorder(borderColor: .brownishGrey, borderWidth: 1.0)
        charging20.setBorder(borderColor: .brownishGrey, borderWidth: 1.0)
        charging50.setBorder(borderColor: .brownishGrey, borderWidth: 1.0)
        chargingAll.setBorder(borderColor: .brownishGrey, borderWidth: 1.0)
    }
    func roundBorder () {
        charging10.makeRounded(cornerRadius: nil)
        charging20.makeRounded(cornerRadius: nil)
        charging50.makeRounded(cornerRadius: nil)
        chargingAll.makeRounded(cornerRadius: nil)
        confirmDonate.makeRounded(cornerRadius: 4.0)
    }
    
    @IBAction func easyChargeBtn(_ sender: UIButton) {
        switch sender.currentTitle {
        case "+ 10":
            let num = Int(self.berryValue.text!) ?? 0
            self.berryValue.text = String(num + 10)
        case "+ 20":
            let num = Int(self.berryValue.text!) ?? 0
            self.berryValue.text = String(num + 20)
        case "+ 50":
            let num = Int(self.berryValue.text!) ?? 0
            self.berryValue.text = String(num + 50)
        case "전액":
            let num = Int(self.berryValue.text!) ?? 0
            self.berryValue.text = String(num + 10)
            //myBerry의 서버에서 전달받은 값을 사용하자.
        default:
            break
        }
    }
    @IBAction func confirmDonate(_ sender: Any) {
        // 스탬프의 개수를 알아온 뒤에
        // 개수에 따라서 베리를 부여할 지 판단하자
        // 서버가 어느정도의 역할을 할지..!
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        guard let berry = Int(self.berryValue.text ?? "10") else {return}
        DonateService.shared.donate(token, berry
        , paramId){
            (data) in
            switch data {
            case .success(let message):
                print(message)
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("path")
            case .serverErr:
                print("server")
            case .networkFail:
                print("네트워크 오류")
            }
            
        }
    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
