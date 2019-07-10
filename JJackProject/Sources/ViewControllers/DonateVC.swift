//
//  DonateVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DonateVC: UIViewController {
    
    @IBOutlet weak var ownBerry: UILabel!
    
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
        self.ownBerry.text = String(UserDefaults.standard.integer(forKey: "ownBerry"))

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
    @IBAction func showChargeView(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Charge", bundle: nil).instantiateViewController(withIdentifier: "ChargeNavigation")as? UINavigationController else {return}
        UserDefaults.standard.set(true, forKey: "fromDonate")

        
        self.present(dvc, animated: true)
    }
    @IBAction func confirmDonate(_ sender: Any) {
        // 스탬프의 개수를 알아온 뒤에
        // 개수에 따라서 베리를 부여할 지 판단하자
        // 서버가 어느정도의 역할을 할지..!
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        print("////////\(token)////////")
        guard let berry = Int(self.berryValue.text ?? "10") else {return}
        DonateService.shared.donate(token, berry
        , paramId){
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            
            switch data {
            case .success(let data):
                guard let data = data as? Donate else {return}
                if data.stamps == 10 {
                    guard let dvc =  self.storyboard?.instantiateViewController(withIdentifier: "GetReward") as?GetRewardVC else {return}
                    print("#######@#############")
                    print(data)
                    dvc.rewardBerry = data.rewordsBerry
                    self.present(dvc, animated: true, completion: nil)
                } else {
                    guard let dvc =  self.storyboard?.instantiateViewController(withIdentifier: "CompleteDonate") as? CompleteDonateAlertVC else {return}
                    print("#######@#############")
                    print(data)
                    self.present(dvc, animated: true, completion: nil)

                }
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
//        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "CompleteDonate")as? CompleteDonateAlertVC else {return}
//        print("#######@#############")
////        print(token)
//        print(berry)
//        self.present(dvc, animated: true, completion: nil)
    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backToDonate (_ segue: UIStoryboardSegue) {
        
    }
}
