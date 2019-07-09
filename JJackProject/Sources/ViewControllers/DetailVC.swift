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
    var datum: Datum?
    
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
    //    func setContainer1Data(container: [Story], index: Int, subTitle: UILabel!, img: UIImageView!, content1: UILabel!, content2: UILabel!){po $arg1

//
//        subTitle.text = gsno(container[index].subTitle)
//        img.imageFromUrl(self.gsno(container[index].img), defaultImgPath: "imgHomeJjack")
//        let contents1 = container[index].content
//        content1.text = gsno(contents1[0])
//        content2.text = contents1[1]
//
//        print("###################################################")
//        print(container[index].subTitle)
//        print("###################################################")
//        print(container[index].img)
//        print("###################################################")
//        print(container[index].content[0])
//        print("###################################################")
//        print(container[index].content[1])
//        print("###################################################")
//    }
    func getStory (id: String) {
        MainService.shared.getDetailData(id) {
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            switch data {
            case .success(let data):
                print(data)
                self.datum = data.self as? Datum
                let realData = self.datum?.story[0]
                print(realData?.subTitle ?? "내 제목은 어디에...")
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
            let dvc = segue.destination as! DonateVC
            // paramId 전달!
            dvc.paramId = paramId
            // 화면 넘기기
        }
        
    }
    
    
    
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
