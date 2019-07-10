//
//  EarnBerryVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class EarnBerryVC: UIViewController {

    @IBOutlet weak var stamp1: UIImageView!
    @IBOutlet weak var stamp2: UIImageView!
    @IBOutlet weak var stamp3: UIImageView!
    @IBOutlet weak var stamp4: UIImageView!
    @IBOutlet weak var stamp5: UIImageView!
    @IBOutlet weak var stamp6: UIImageView!
    @IBOutlet weak var stamp7: UIImageView!
    @IBOutlet weak var stamp8: UIImageView!
    @IBOutlet weak var stamp9: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.stamp1.tag = 1
        self.stamp2.tag = 2
        self.stamp3.tag = 3
        self.stamp4.tag = 4
        self.stamp5.tag = 5
        self.stamp6.tag = 6
        self.stamp7.tag = 7
        self.stamp8.tag = 8
        self.stamp9.tag = 9
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
