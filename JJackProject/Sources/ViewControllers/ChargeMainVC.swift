//
//  ChargeMainVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 07/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class ChargeMainVC: UIViewController {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var bank: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.card.makeRounded(cornerRadius: 8.0)
        self.bank.makeRounded(cornerRadius: 8.0)
    }
    

    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cardPay(_ sender: Any) {
        self.simpleAlert(title: "아직 준비 중입니다.", message: "무통장입금을 사용해 주세요!")
    }
    
}
