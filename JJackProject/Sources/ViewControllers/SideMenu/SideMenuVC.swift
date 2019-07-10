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
    
    @IBOutlet weak var ownBerry: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    

    func setup() {
        self.useInfo.setBorder(borderColor: UIColor.veryLightPink, borderWidth: 1.0)
        self.useInfo.makeRounded(cornerRadius: 15.5)
        
        self.ownBerry.text = String(UserDefaults.standard.integer(forKey: "ownBerry"))
    }
    @IBAction func goHome(_ sender: Any) {
        backHome()
    }
    
    @IBAction func showChargingView(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Charge", bundle: nil).instantiateViewController(withIdentifier: "ChargeNavigation")as? UINavigationController else {return}
        
        UserDefaults.standard.set(false, forKey: "fromDonate")

        self.present(dvc, animated: true)
    }
    @IBAction func showHistory(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "UseHistoryVC") as? UseHistoryVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    @IBAction func showRanking(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Ranking", bundle: nil).instantiateViewController(withIdentifier: "Ranking")as? RankingVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    @IBAction func showRecord(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Record", bundle: nil).instantiateViewController(withIdentifier: "Record")as? RecordedDonationVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func showMyPage(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPage")as? MyPageVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func cancelMenu(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goMainView(_ sender: UIButton) {
        guard let dvc = UIStoryboard(name: "HomeMain", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as? MainVC else {return}
        
        var index:Int = 0
        
        switch sender.currentImage {
        case UIImage(named: "icChildren"):
            index = 0
        case UIImage(named: "icSenior"):
            index = 1
        case UIImage(named: "icAnimal"):
            index = 2
        case UIImage(named: "icDisabled"):
            index = 3
        case UIImage(named: "icEnvironment"):
            index = 4
        case UIImage(named: "icEmergency"):
            index = 5
        default:
            break
        }
        dvc.paramIndex = index
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    
}
