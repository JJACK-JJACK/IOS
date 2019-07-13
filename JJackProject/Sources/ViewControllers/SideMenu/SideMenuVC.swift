//
//  SideMenuVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var useInfo: UIButton!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var ownBerry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    

    func setup() {
        
        self.useInfo.setBorder(borderColor: UIColor.veryLightPink, borderWidth: 1.0)
        self.useInfo.makeRounded(cornerRadius: 15.5)
        
        // 보유 베리, 닉네임, 이메일 정보 UserDefaults에서 가져오기
        self.ownBerry.text = String(UserDefaults.standard.integer(forKey: "ownBerry"))
        self.nickname.text = UserDefaults.standard.string(forKey: "nickname")
        self.email.text = UserDefaults.standard.string(forKey: "email")
    }
    
    @IBAction func goHome(_ sender: Any) {
        backHome()
    }
    
    // 충전하기 뷰로 이동
    @IBAction func showChargingView(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Charge", bundle: nil).instantiateViewController(withIdentifier: "ChargeNavigation")as? UINavigationController else {return}
        
        UserDefaults.standard.set(false, forKey: "fromDonate")

        self.present(dvc, animated: true)
    }
    // 이용내역 뷰로 이동
    @IBAction func showHistory(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "UseHistoryVC") as? UseHistoryVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    // 전달 후기 뷰로 이동
    @IBAction func showRanking(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Ranking", bundle: nil).instantiateViewController(withIdentifier: "Ranking")as? RankingVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    // 나의기부 뷰로 이동
    @IBAction func showRecord(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Record", bundle: nil).instantiateViewController(withIdentifier: "Record")as? RecordedDonationVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    // 마이페이지 뷰로 이동
    @IBAction func showMyPage(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPage")as? MyPageVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    // 취소
    @IBAction func cancelMenu(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // 홈으로 이동
    @IBAction func goMainView(_ sender: UIButton) {
        guard let dvc = UIStoryboard(name: "HomeMain", bundle: nil).instantiateViewController(withIdentifier: "Main") as? MainVC else {return}
        
        var index:Int = 0
        var serverIndex: Int = 0
        
        // 해당 카테고리로 이동
        switch sender.currentImage {
        case UIImage(named: "icChildren"):
            index = 0
            serverIndex = 1
        case UIImage(named: "icSenior"):
            index = 1
            serverIndex = 5
        case UIImage(named: "icAnimal"):
            index = 2
            serverIndex = 0
        case UIImage(named: "icDisabled"):
            index = 3
            serverIndex = 2
        case UIImage(named: "icEnvironment"):
            index = 4
            serverIndex = 3
        case UIImage(named: "icEmergency"):
            index = 5
            serverIndex = 4
        default:
            break
        }
        // 값 전달
        dvc.viewCategory = index
        dvc.paramIndex = serverIndex
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    
}
