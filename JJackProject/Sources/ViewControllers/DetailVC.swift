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
    
    
    
    @IBOutlet weak var planListView: UITableView!
    
    var planList = [Datum]()
    
    var plans = [Plan]()
    
    @IBOutlet weak var planListViewHeight: NSLayoutConstraint!
    @IBOutlet weak var container2: UIView!
    
    

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
        
        planListView.dataSource = self
        
        getStory(id: gsno(paramId))
    }
    
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
        self.date.text = "D - " + paramDate
        self.processRate.text = String(paramProcess) + "%"
        self.donatedBerry.text = String(paramDonated)
        self.goalBerry.text = String(paramGoal)
        
        self.totalPrice.text = String(paramGoal)
        
        // ready for container view
        self.container2.isHidden = true
        self.onPlan.constant = 0
        
        // show the process of donation
        activateProcess()
        
        print(planList.count)
//        print(planList[0].plan.count)
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
                self.planList = (data.self as? [Datum])!
                
                let contain1 = self.planList[0]
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
                
                self.plans = self.planList[0].plan!
                

                self.planListView.reloadData()
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
                self.view.layoutIfNeeded()
            }))
            self.onStory.constant = 0
            self.story.setTitleColor(.brownGrey, for: .normal)
            self.story.titleLabel?.font = .Light2
            
            self.container1.isHidden = true
        }
        
        if plan.isSelected { (UIView.animate(withDuration: 0.3, animations: {
            self.onPlan.constant = 57
            self.view.layoutIfNeeded()
        }))
            print("###################")
            print(planList.count)
            self.plan.setTitleColor(.JackBlack, for: .normal)
            self.plan.titleLabel?.font = .Bold2
    
            self.container2.isHidden = false
            self.planListViewHeight.constant = CGFloat(64 * plans.count + 20)
            self.viewHeight.constant = self.container2.frame.height
        }else {
            (UIView.animate(withDuration: 0.3, animations: {
                self.onPlan.constant = 0
                self.view.layoutIfNeeded()
            }))
            print("#######################")
            print(planList.count)
            self.plan.setTitleColor(.brownGrey, for: .normal)
            self.plan.titleLabel?.font = .Light2
            self.container2.isHidden = true
        }
        story.isSelected = false
        plan.isSelected = false
    }
    
    // 기부하기로 넘어가기!
    
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

extension DetailVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("####################")
        print(plans.count)
        
        return plans.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = planListView.dequeueReusableCell(withIdentifier: "plan") as! DetailPlanCell
//        let plan = planList[0].plan!
//        let planData = planList[0].plan![indexPath.row]
        let planData = plans[indexPath
        .row]
        cell.index.text = String(indexPath.row + 1)
        cell.purpose.text = planData.purpose
        cell.price.text = String(planData.price)
        
        self.planListViewHeight.constant = CGFloat(64 * plans.count + 20)

        
        return cell
    }
    
    
}

