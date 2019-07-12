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
