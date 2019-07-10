//
//  DetailRecordVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DetailRecordVC: UIViewController {
    
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
    
    
    @IBOutlet weak var statusDot1: UIView!
    @IBOutlet weak var statusDot2: UIView!
    @IBOutlet weak var statusDot3: UIView!
    
    @IBOutlet weak var stateText1: UILabel!
    @IBOutlet weak var stateText2: UILabel!
    @IBOutlet weak var stateText3: UILabel!
    
    @IBOutlet weak var ongoingLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var completeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    var paramThumbImg: String = ""
    var paramTitle: String = ""
    var paramInstitution: String = ""
    var paramDate: String = ""
    var paramProcess: Int = 0
    var paramDonated: Int = 0
    var paramStatus: Int = 0

    func setup() {
        // insert values
        self.thumbImg.imageFromUrl(self.gsno(paramThumbImg), defaultImgPath: "imgHomeJjack")
        self.name.text = paramTitle
        self.institution.text = paramInstitution
        self.date.text = paramDate
        self.processRate.text = String(paramProcess) + "%"
        self.donatedBerry.text = String(paramDonated)
        
        
        
        self.statusDot1.makeRounded(cornerRadius: nil)
        self.statusDot2.makeRounded(cornerRadius: nil)
        self.statusDot3.makeRounded(cornerRadius: nil)
        
        // show progress
        activateProcess()
        
        // 색구분해주기
        sortingStatus()
    }
    
    func activateProcess () {
        let rate = Double(paramProcess)
        let width = self.view.frame.width
        let show = round( (Double(width)
            - 40.0) * (rate / 100.0) )
        if show >= Double(width) {self.showRate.constant = width}
        else {self.showRate.constant = CGFloat(show)}
        
        
        // status Bar Border make rounded
        self.statusBar.makeRounded(cornerRadius: nil)
        self.rateBar.makeRounded(cornerRadius: nil)
    }
    
    func sortingStatus () {
        let status = paramStatus
        switch status {
        case 0:
            self.date.textColor = UIColor.pointCol
            self.rateBar.backgroundColor = UIColor.pointCol
            self.processRate.textColor = UIColor.pointCol
            self.statusDot1.backgroundColor = UIColor.pointCol
            self.ongoingLabel.textColor = UIColor.pointCol
            self.stateText1.textColor = UIColor(white: 52.0/166.0, alpha: 1.0)
        case 1:
            self.date.textColor = UIColor.closeCol
            self.rateBar.backgroundColor = UIColor.closeCol
            self.processRate.textColor = UIColor.closeCol
            self.statusDot2.backgroundColor = UIColor.closeCol
            self.closeLabel.textColor = UIColor.closeCol
            self.stateText2.textColor = UIColor(white: 52.0/166.0, alpha: 1.0)
        case 2:
            self.date.textColor = UIColor.completeCol
            self.rateBar.backgroundColor = UIColor.completeCol
            self.processRate.textColor = UIColor.completeCol
            self.statusDot3.backgroundColor = UIColor.completeCol
            self.completeLabel.textColor = UIColor.completeCol
            self.stateText3.textColor = UIColor(white: 52.0/166.0, alpha: 1.0)
        default:
            break
        }
    }
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
