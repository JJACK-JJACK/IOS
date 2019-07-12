//
//  DonateVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DonateVC: UIViewController{
    
    @IBOutlet weak var ownBerry: UILabel!
    
    @IBOutlet weak var deleteBerry: UIButton!
    
    @IBOutlet weak var charging10: UIButton!
    @IBOutlet weak var charging20: UIButton!
    @IBOutlet weak var charging50: UIButton!
    @IBOutlet weak var chargingAll: UIButton!
    
    @IBOutlet weak var berryValue: UITextField!
    
    @IBOutlet weak var confirmDonate: UIButton!
    
    var paramId: String = ""
    var myBerryAmount: Int = UserDefaults.standard.integer(forKey: "ownBerry")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    func setup() {
        setBorder()
        roundBorder()
        // 내가 가지고있는 베리 가져오기
        self.ownBerry.text = String(myBerryAmount)

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
    
    @IBAction func eraseBerry(_ sender: Any) {
        self.berryValue.text = ""
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
            self.berryValue.text = String(myBerryAmount)
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
    
    // 기부하기 확인
    @IBAction func confirmDonate(_ sender: Any) {
        guard let berry = Int(self.berryValue!.text!) else {return}
        
        print("여기는 기부하기")
        if self.myBerryAmount >= berry {
            guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
            print("token: \(token)")
            print(berry)
            print(paramId)
            DonateService.shared.donate(token, berry
            , paramId){
                [weak self]
                (data) in
                
                guard let `self` = self else {return}
                
                switch data {
                case .success(let data):
                    guard let data = data as? Donate else {return}
                    print(data.rewordsBerry!)
                    print(data.stamps!)
                    print(data.totalBerry!)
                    if data.stamps == 10 {
                        guard let dvc =  self.storyboard?.instantiateViewController(withIdentifier: "GetReward") as?GetRewardVC else {return}
                        print("#######@#############")
                        print(data)
                        dvc.rewardBerry = data.rewordsBerry!
                        self.present(dvc, animated: true, completion: nil)
                    } else {
                        guard let dvc =  self.storyboard?.instantiateViewController(withIdentifier: "CompleteDonate") as? UINavigationController else {return}
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
        } else {self.simpleAlert(title: "기부 실패", message: "베리가 부족합니다.")}

    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backToDonate (_ segue: UIStoryboardSegue) {
        
    }
}
