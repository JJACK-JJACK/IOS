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
    
    var paramThumbImg: String = ""
    var process: Int = 0
    var berry: Int = 0
    var subTitle: String = ""
    var content1: String = ""
    var content2: String = ""
    var contentImg: String = ""
    var purpose1: String = ""
    var purpose2: String = ""
    var purpose3: String = ""
    var price1: Int = 0
    var price2: Int = 0
    var price3: Int = 0
    var totalPrice: Int = 0
    func setup() {
        
    }
    
    
    @IBAction func Back(_ sender: Any) {
        self.pop()
    }
    
}
