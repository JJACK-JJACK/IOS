//
//  MainVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 03/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit
import SideMenu

class MainVC: UIViewController {
    
    let imageSet: [UIImage] = [
        (UIImage(named: "icCard"))!,
        (UIImage(named: "icCard"))!,
        (UIImage(named: "icCard"))!,
        (UIImage(named: "icCard"))!,
        (UIImage(named: "icCard"))!,
        (UIImage(named: "icCard"))!
    ]

    @IBOutlet weak var mainView: UICollectionView!
    
    var infoSet: [MainInfo] = []
    
    @IBOutlet weak var donationInfoView: UITableView!
    
    @IBOutlet weak var child: UIButton!
    @IBOutlet weak var senior: UIButton!
    @IBOutlet weak var animal: UIButton!
    @IBOutlet weak var disabled: UIButton!
    @IBOutlet weak var environment: UIButton!
    @IBOutlet weak var emergency: UIButton!
    
    
    var parmaIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainView.dataSource = self
        mainView.delegate = self
        donationInfoView.dataSource = self
        donationInfoView.delegate = self
        
        setBoldCategory(response: parmaIndex)
        
        setInfoData()
//        setup()
        self.loadViewIfNeeded()
        
        //sideMenu setUp
        setupSideMenu()

    
    }
//    func setup(){
//        self.statusBar.makeRounded(cornerRadius: nil)
//        self.activateBar.makeRounded(cornerRadius: nil)
//    }
    // 선택시 볼더로 변경..!
    // 솝툰에 있는 알고리즘을 빌려와서 콜렉션뷰랑 연결한후
    // 이 함수와도 연결해 보자..
    func setBoldCategory (response: Int) {
        print(response)
        switch response {
        case 0:
            self.child.titleLabel?.font = UIFont.Bold
            self.child.setTitleColor(.JackBlack, for: .normal)
        case 1:
            self.senior.titleLabel?.font = UIFont.Bold
            self.senior.setTitleColor(.JackBlack, for: .normal)
        case 2:
            self.animal.titleLabel?.font = UIFont.Bold
            self.animal.setTitleColor(.JackBlack, for: .normal)
        case 3:
            self.disabled.titleLabel?.font = UIFont.Bold
            self.disabled.setTitleColor(.JackBlack, for: .normal)
        case 4:
            self.environment.titleLabel?.font = UIFont.Bold
            self.environment.setTitleColor(.JackBlack, for: .normal)
        case 5:
            self.emergency.titleLabel?.font = UIFont.Bold
            self.emergency.setTitleColor(.JackBlack, for: .normal)
        default:
             break
        }
    }
    
    // 선택되어 넘어온 카테고리 보여주기 셀!
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        collectionView.cellForItem
    }
    @IBAction func showMenu(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenu")as? UISideMenuNavigationController else {return}
        
        navigationController?.show(dvc, sender: self)
    }
    @IBAction func goHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension MainVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath)as! HomeCell
        
        let image = imageSet[indexPath.item]
        
        cell.categoryImg.image = image
        
        return cell
    }
}
extension MainVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 375
        let height: CGFloat = 203
        
        return CGSize(width: width, height: height)
    }
    // minimumLineSpacingForSectionAt 은 수직 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    // minimumInteritemSpacingForSectionAt 은 수평 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // insetForSectionAt 섹션 내부 여백을 말합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1,  left: 1, bottom: 1, right: 1)
    }
    
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail")as? DetailVC else {return}
        let info = infoSet[indexPath.row]
        
        dvc.paramThumbImg = info.thumbImg
        dvc.paramTitle = info.title
        dvc.paramInstitution = info.institution
        dvc.paramDate = info.date
        dvc.paramProcess = info.processRate
        dvc.paramDonated = info.donatedBerry
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}
extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = donationInfoView.dequeueReusableCell(withIdentifier: "MainCell")as! MainCell
        let List = infoSet[indexPath.row]
        
        cell.thumbImg.image = UIImage(named: List.thumbImg)
        cell.date.text = List.date
        cell.title.text = List.title
        cell.institution.text = List.institution
        cell.processRate.text = List.processRate + "%"
        cell.donatedBerry.text = List.donatedBerry
        
        let rate = Double(List.processRate) ?? 0.0
        let num = round(197 * (rate / 100.0))
        cell.showRate.constant = CGFloat(num)
        
        return cell
    }
    
    
}
extension MainVC {
    func setInfoData() {
        let info1 = MainInfo(thumbnail: "icCard", date: "D - 41", title: "올 겨울 혜리에게도 따뜻한 이불을 주세요!",institution: "사회 복지관", processRate: "50", donatedBerry: "404,040")
        let info2 = MainInfo(thumbnail: "icCard", date: "D - 32", title: "올 겨울 혜리에게도 따뜻한 이불을 주세요!",institution: "샬롬 요양원", processRate: "70", donatedBerry: "404,040")
        let info3 = MainInfo(thumbnail: "icCard", date: "D - 321", title: "올 겨울 혜리에게도 따뜻한 이불을 주세요!", institution: "주남바다요양센터", processRate: "20", donatedBerry: "404,040")
        
        self.infoSet = [info1, info2, info3]
    }
}
