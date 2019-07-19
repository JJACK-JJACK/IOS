//
//  CompleteChargeVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 06/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class CompleteChargeVC: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var chargedPrice: UILabel!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var Account: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.confirmBtn.makeRounded(cornerRadius: 8.0)
        
        self.chargedPrice.text = chargedBerry
        self.bankName.text = paramBank + "은행"
        self.Account.text = paramAccount
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let toString = formatter.string(from: Date(timeIntervalSinceNow: 86400))
        
        let dueDate = formatter.date(from: toString)
        formatter.dateFormat = "yyyy-MM-dd"
        let dueDateString = formatter.string(from: dueDate!)
        
        self.dueDate.text = dueDateString + " 까지"
        
        print("입금할 금액: \(chargedBerry)")
        print("입금 은행: \(paramBank)")
        print("입금 계좌: \(paramAccount)")
        print("입금 기한 날짜: \(dueDateString)")
    }
    
    var chargedBerry: String = "1,100원"
    var paramBank: String = ""
    var paramAccount: String = ""
    
    @IBAction func confirmCharge(_ sender: Any) {
        let fromDonateView = UserDefaults.standard.bool(forKey: "fromDonate")
        if fromDonateView {
            performSegue(withIdentifier: "backToDonate", sender: self)
        }else {
            performSegue(withIdentifier: "goHome", sender: self)
        }
    }
    
    @IBAction func cancle(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
