//
//  DetailVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var institution: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var processRate: UILabel!
    @IBOutlet weak var donatedBerry: UILabel!
    @IBOutlet weak var showRate: NSLayoutConstraint!
    
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var rateBar: UIView!
    
    @IBOutlet weak var goalBerry: UILabel!
    
    @IBOutlet weak var story: UIButton!
    @IBOutlet weak var plan: UIButton!
    
    @IBOutlet weak var onStory: NSLayoutConstraint!
    @IBOutlet weak var onPlan: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    var paramThumbImg: String = ""
    var paramTitle: String = ""
    var paramInstitution: String = ""
    var paramDate: String = ""
    var paramProcess: String = ""
    var paramDonated: String = ""
//    var paramGoal: String = ""
    func setup() {
        // insert values
        self.thumbImg.image = UIImage(named: paramThumbImg)
        self.name.text = paramTitle
        self.institution.text = paramInstitution
        self.date.text = paramDate
        self.processRate.text = paramProcess + "%"
        self.donatedBerry.text = paramDonated
        
        let rate = Double(paramProcess) ?? 0.0
        let width = self.view.frame.width
        let show = round( (Double(width)
            - 40.0) * (rate / 100.0) )
        self.showRate.constant = CGFloat(show)
        // status Bar Border make rounded
        self.statusBar.makeRounded(cornerRadius: nil)
        self.rateBar.makeRounded(cornerRadius: nil)
        
        self.onPlan.constant = 0
    }
    
    @IBAction func showInfo(_ sender: UIButton) {
        print(sender.isSelected)
        if !sender.isSelected {
            sender.isSelected = true
        }
        
        switch sender.currentTitle {
        case "기부스토리":
            // 통신!
            plan.isSelected = false
        case "사용계획":
            // 통신!
            story.isSelected = false
        default:
            break
        }
        
        if story.isSelected { (UIView.animate(withDuration: 0.3, animations: {
            self.onStory.constant = 70
            self.view.layoutIfNeeded()
        }))
            self.story.setTitleColor(.JackBlack, for: .normal)
            self.story.titleLabel?.font = .Bold2
        }else {
            (UIView.animate(withDuration: 0.3, animations: {
                self.onStory.constant = 0
                self.view.layoutIfNeeded()
            }))
            self.story.setTitleColor(.brownGrey, for: .normal)
            self.story.titleLabel?.font = .Light2
        }
        
        if plan.isSelected { (UIView.animate(withDuration: 0.3, animations: {
            self.onPlan.constant = 57
            self.view.layoutIfNeeded()
        }))
            self.plan.setTitleColor(.JackBlack, for: .normal)
            self.plan.titleLabel?.font = .Bold2
        }else {
            (UIView.animate(withDuration: 0.3, animations: {
                self.onPlan.constant = 0
                self.view.layoutIfNeeded()
            }))
            self.plan.setTitleColor(.brownGrey, for: .normal)
            self.plan.titleLabel?.font = .Light2
        }
        story.isSelected = false
        plan.isSelected = false
    }
    
    
    
    
    
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
