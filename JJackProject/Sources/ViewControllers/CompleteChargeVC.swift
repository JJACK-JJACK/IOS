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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.confirmBtn.makeRounded(cornerRadius: 8.0)
    }
    

    

    @IBAction func cancle(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
