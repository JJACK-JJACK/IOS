//
//  GetRewardVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 11/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class GetRewardVC: UIViewController {

    @IBOutlet weak var reward: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.reward.text = String(rewardBerry)
    }
    
    var rewardBerry: Int = 0
    
    
}
