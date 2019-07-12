//
//  ChargeMainVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 07/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class ChargeMainVC: UIViewController {

    @IBOutlet weak var card: UIButton!
    @IBOutlet weak var bank: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.card.makeRounded(cornerRadius: 8.0)
        self.bank.makeRounded(cornerRadius: 8.0)
    }
    

    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
