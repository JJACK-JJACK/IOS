//
//  EarnBerryVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class EarnBerryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension EarnBerryVC {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.view.makeRounded(cornerRadius: 8.0)
    }
}
