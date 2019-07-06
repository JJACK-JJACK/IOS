//
//  DetailRankingVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 06/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DetailRankingVC: UIViewController {

    @IBOutlet weak var processRate: NSLayoutConstraint!
    
    @IBOutlet weak var processBar: UIView!
    @IBOutlet weak var staticBar: UIView!
    
    @IBOutlet weak var thumbImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        processBar.makeRounded(cornerRadius: nil)
        staticBar.makeRounded(cornerRadius: nil)
    }
    
    var paramThumbImg : UIImage?
    
    @IBAction func Back(_ sender: Any) {
        self.pop()
    }
    
}
