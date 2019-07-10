//
//  DetailVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var container1: UIView!
    
    @IBOutlet weak var subTitle1: UILabel!
    @IBOutlet weak var content1_1: UILabel!
    @IBOutlet weak var content1_2: UILabel!
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var subTitle2: UILabel!
    @IBOutlet weak var content2_1: UILabel!
    @IBOutlet weak var content2_2: UILabel!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var subTitle3: UILabel!
    @IBOutlet weak var content3_1: UILabel!
    @IBOutlet weak var content3_2: UILabel!
    @IBOutlet weak var image3: UIImageView!
    

    
    @IBOutlet weak var container2: UIView!
    
    @IBOutlet weak var purpose1: UILabel!
    @IBOutlet weak var price1: UILabel!
    
    @IBOutlet weak var purpose2: UILabel!
    @IBOutlet weak var price2: UILabel!
    
    @IBOutlet weak var purpose3: UILabel!
    @IBOutlet weak var price3: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    
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
        print(paramId)
        print("여기는 디테일")
        
        getStory(id: gsno(paramId))
    }
    var datum = [Datum]()
    
    var paramThumbImg: String = ""
    var paramTitle: String = ""
    var paramInstitution: String = ""
    var paramDate: String = ""
    var paramProcess: Int = 0
    var paramDonated: Int = 0
    var paramGoal: Int = 0
    
    var paramId: String = ""
    func setup() {
        // insert values
        self.thumbImg.imageFromUrl(gsno(paramThumbImg), defaultImgPath: "imgHomeJjack")
        self.name.text = paramTitle
        self.institution.text = paramInstitution
        self.date.text = paramDate
        self.processRate.text = String(paramProcess) + "%"
        self.donatedBerry.text = String(paramDonated)
        self.goalBerry.text = String(paramGoal)

        // ready for container view
        self.container2.isHidden = true
        self.onPlan.constant = 0
        
        // show the process of donation
        activateProcess()
    }
    func activateProcess() {
        let rate = Double(paramProcess)
        let width = Double(self.view.frame.width) -  40.0
        let show = round( width * (rate / 100.0) )
        if show >= width { self.showRate.constant = CGFloat(width)}
        else { self.showRate.constant = CGFloat(show) }
        // status Bar Border make rounded
        self.statusBar.makeRounded(cornerRadius: nil)
        self.rateBar.makeRounded(cornerRadius: nil)
    }
    func getStory (id: String) {
        MainService.shared.getDetailData(id) {
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            switch data {
            case .success(let data):
//                print(data)
                self.datum = (data.self as? [Datum])!
                let contain1 = self.datum[0]
//                print(contain1.centerName)
//                print(contain1.story[0].subTitle)
//                print(contain1.story[1].subTitle)
//                print(contain1.title)
                let story1 = contain1.story[0]
                self.subTitle1.text = story1.subTitle
                self.content1_1.text = story1.content[0]
                self.content1_2.text = story1.content[1]
                self.image1.imageFromUrl(self.gsno(story1.img), defaultImgPath: "imgHomeJjack")
                let story2 = contain1.story[1]
                self.subTitle2.text = story2.subTitle
                self.content2_1.text = story2.content[0]
                self.content2_2.text = story2.content[1]
                self.image2.imageFromUrl(self.gsno(story2.img), defaultImgPath: "imgHomeJjack")
                let story3 = contain1.story[2]
                self.subTitle3.text = story3.subTitle
                self.content3_1.text = story3.content[0]
                self.content3_2.text = story3.content[1]
                self.image3.imageFromUrl(self.gsno(story3.img), defaultImgPath: "imgHomeJjack")
                
                let contain2 = self.datum[0]
                let plan1 = contain2.plan[0]
                self.purpose1.text = plan1.purpose
                self.price1.text = String(plan1.price)
                let plan2 = contain2.plan[1]
                self.purpose2.text = plan2.purpose
                self.price2.text = String(plan2.price)
                let plan3 = contain2.plan[2]
                self.purpose3.text = plan3.purpose
                self.price3.text = String(plan3.price)
                
                self.totalPrice.text = String(plan1.price + plan2.price + plan3.price)
                
                //                print(common.story)
//                print("###########################")
//                print(common.centerName)
//                print(common.categoryID)
//                print(common.maxBerry)
//                let contain1 = common.story[0]
//                print(contain
//                print("###########################")
//                self.subTitle1.text = contain1.subTitle
//                print(contain1.subTitle)
//                print("###########################")
//                self.thumbImg.imageFromUrl(self.gsno(contain1.img), defaultImgPath: "imgHomeJjack")
//                print(contain1.img)
//                print("###########################")
//                let contents1 = contain1.content
//                self.content1_1.text = contents1[0]
//                print(contents1[0])
//                print("###########################")
//                self.content1_2.text = contents1[1]
//                print(contents1[1])
//                print("###########################")
                
                self.container1.reloadInputViews()
                self.container2.reloadInputViews()
                break
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("path")
            case .serverErr:
                print("server")
            case .networkFail:
                print("networkout")
                
            }
        }
    }
//    func getPlan(){
//        MainService.shared.getDetailData(paramId) {
//            [weak self]
//            (data) in
//            switch data {
//            case .success(let data):
//
//            case .requestErr(let message):
//                print(message)
//            case .pathErr:
//                print("path")
//            case .serverErr:
//                print("server")
//            case .networkFail:
//                print("네트워크 오류")
//            }
//        }
//    }
    @IBAction func showInfo(_ sender: UIButton) {
        print(sender.isSelected)
        if !sender.isSelected {
            sender.isSelected = true
        }
        
        switch sender.currentTitle {
        case "기부스토리":
            getStory(id: paramId)
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
            
            self.container1.isHidden = false
            self.viewHeight.constant = 1846
        }else {
            (UIView.animate(withDuration: 0.3, animations: {
                self.onStory.constant = 0
                self.view.layoutIfNeeded()
            }))
            self.story.setTitleColor(.brownGrey, for: .normal)
            self.story.titleLabel?.font = .Light2
            
            self.container1.isHidden = true
        }
        
        if plan.isSelected { (UIView.animate(withDuration: 0.3, animations: {
            self.onPlan.constant = 57
            self.view.layoutIfNeeded()
        }))
            self.plan.setTitleColor(.JackBlack, for: .normal)
            self.plan.titleLabel?.font = .Bold2
    
            self.container2.isHidden = false
            self.viewHeight.constant = container2.frame.height
        }else {
            (UIView.animate(withDuration: 0.3, animations: {
                self.onPlan.constant = 0
                self.view.layoutIfNeeded()
            }))
            self.plan.setTitleColor(.brownGrey, for: .normal)
            self.plan.titleLabel?.font = .Light2
            self.container2.isHidden = true
        }
        story.isSelected = false
        plan.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDonate"{
            let dvc2 = segue.destination as! DonateVC
            
            // paramId 전달!
            dvc2.paramId = paramId
            // 화면 넘기기
        }
        
    }
    
    
    
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
