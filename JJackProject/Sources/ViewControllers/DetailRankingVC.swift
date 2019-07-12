//
//  DetailRankingVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 06/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DetailRankingVC: UIViewController {
    
    
    @IBOutlet weak var entireScrollView: UIView!
    

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
    
    @IBOutlet weak var maxBerry: UILabel!
    
    
    @IBOutlet weak var planListView: UITableView!
    
    var plans = [Plan]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        processBar.makeRounded(cornerRadius: nil)
        staticBar.makeRounded(cornerRadius: nil)
        
        
        self.planListView.dataSource = self
        
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
        self.maxBerry.text = String(max)

    }
    
    
    @IBAction func Back(_ sender: Any) {
        self.pop()
    }
    
}
// plan Table 로 설정하기
extension DetailRankingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = planListView.dequeueReusableCell(withIdentifier: "plan")as! DetailPlanCell
        let plan = plans[indexPath.row]
        cell.index.text = String(indexPath.row + 1)
        cell.purpose.text = plan.purpose
        cell.price.text = String(plan.price)
        
        return cell
    }
    
    
}
