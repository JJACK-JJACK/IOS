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
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var totalBerry: UILabel!

    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var comment1: UILabel!
    @IBOutlet weak var commnet2: UILabel!
    @IBOutlet weak var storyImg: UIImageView!
    
    @IBOutlet weak var planPurpose: UILabel!
    @IBOutlet weak var planPrice: UILabel!
    
    @IBOutlet weak var maxBerry: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        processBar.makeRounded(cornerRadius: nil)
        staticBar.makeRounded(cornerRadius: nil)
        
        setup()
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
    var max: Int = 0
    
    func setup() {
        self.thumbImg.imageFromUrl(self.gsno(paramThumbImg), defaultImgPath: "imgHomeJjack")
        self.percentage.text = String(process) + "%"
        self.totalBerry.text = String(berry)
        
        let rate = Double(process)
        let width = self.staticBar.frame.width
        let show = round( (Double(width)
            - 40.0) * (rate / 100.0) )
        if show >= Double(width) {self.processRate.constant = width}
        else {self.processRate.constant = CGFloat(show)}
        
        self.subtitle.text = subTitle
        self.comment1.text = content1
        self.commnet2.text = content2
        self.storyImg.imageFromUrl(self.gsno(contentImg), defaultImgPath: "imgHomeJjack")
        self.planPurpose.text = purpose1
        self.planPrice.text = String(price1)
        self.maxBerry.text = String(max)

    }
    
    
    @IBAction func Back(_ sender: Any) {
        self.pop()
    }
    
}
