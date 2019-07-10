//
//  MainVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 03/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit
import SideMenu

class MainVC: UIViewController, UIScrollViewDelegate{
    
    let imageSet: [UIImage] = [
        (UIImage(named: "icChildren"))!,
        (UIImage(named: "icSenior"))!,
        (UIImage(named: "icAnimal"))!,
        (UIImage(named: "icDisabled"))!,
        (UIImage(named: "icEnvironment"))!,
        (UIImage(named: "icEmergency"))!
    ]

    @IBOutlet weak var mainView: UICollectionView!
    
    var infoSet = [Main]()
//    var infoSet: [Info] = []
    
    @IBOutlet weak var donationInfoView: UITableView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var child: UIButton!
    @IBOutlet weak var senior: UIButton!
    @IBOutlet weak var animal: UIButton!
    @IBOutlet weak var disabled: UIButton!
    @IBOutlet weak var environment: UIButton!
    @IBOutlet weak var emergency: UIButton!
    
    @IBOutlet weak var upToDate: UIButton!
    @IBOutlet weak var highDonated: UIButton!
    @IBOutlet weak var lowDonated: UIButton!
    
    // Home 에서 Select 된 카테고리의 인덱스패스 값
    // 이 값들은 처음 실행 되고 나서 바뀐 값으로 유지 되고 갱신 되지 않는다.
    var paramIndex: Int = 1
    var arrangeIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainView.dataSource = self
        mainView.delegate = self
        donationInfoView.dataSource = self
        donationInfoView.delegate = self
        
        scrollView.delegate = self
        
        // 환경부터 Select시에 스크롤 필요!
        setBoldCategory(response: paramIndex)
        
        // 초기 설정.. 굳이?
        setBtn(button: upToDate, color: .JackBlack, font: .Medium2)


        self.loadViewIfNeeded()
    
        // Home 에서 Main 이동 시 Main 기본 화면
//        scroll(index: paramIndex)
        // 다른 화면 전환 후 다시 올때
        // paramIndex arrangeIndex 유지 할건지 아니면 초기화 할건지!
        getFilteredList(category: paramIndex, filter: arrangeIndex)
        print(arrangeIndex)

    
    }
    // Home 에서 Main 이동 시 Main 기본 화면
    // 처음부터 화면이 나오게는 할 수 없나?
    override func viewDidAppear(_ animated: Bool) {
        scroll(index: paramIndex)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // deselectRow after click
        
        if let index = donationInfoView.indexPathForSelectedRow {
            donationInfoView.deselectRow(at: index, animated: true)
        }
    }

    // 버튼 클릭시 컬랙션 뷰 스크롤
    func scroll (index: Int) {
        let menuIndex = NSIndexPath(item: index, section: 0)
        self.mainView.scrollToItem(at: menuIndex as IndexPath, at: .centeredHorizontally, animated: true)
    }


    // 선택시 볼더로 변경..!
    // 솝툰에 있는 알고리즘을 빌려와서 콜렉션뷰랑 연결한후
    // 이 함수와도 연결해 보자..
    func setBoldCategory (response: Int) {
    
        switch response {
        case 0:
            setBtn(button: child, color: .JackBlack, font: .Bold)
        case 1:
           setBtn(button: senior, color: .JackBlack, font: .Bold)
        case 2:
            setBtn(button: animal, color: .JackBlack, font: .Bold)
        case 3:
            setBtn(button: disabled, color: .JackBlack, font: .Bold)
        case 4:
           setBtn(button: environment, color: .JackBlack, font: .Bold)
        case 5:
            setBtn(button: emergency, color: .JackBlack, font: .Bold)
        default:
             break
        }
        
        scroll(index: response)
        
    }
    // Donation List 내역 불러오기
//    func getDonatedList(category: Int) {
//        MainService.shared.getDonationList(category) {
//            [weak self]
//            (data) in
//            guard let `self` = self else {return}
//            switch data {
//            case .success(let data):
//                // infoset에 [info]형태를 갖춘 데이터들을 넣어서 info의 형식을 완성해야 한다.
//                self.infoSet = (data.self as? [Datum])!
//                self.donationInfoView.reloadData()
//                break
//            default:
//                break
//            }
//        }

//    }
    //Bolding Category
    @IBAction func selectCategory(_ sender: UIButton) {
        setBtn(button: child, color: .brownGrey, font: .Light)
        setBtn(button: senior, color: .brownGrey, font: .Light)
        setBtn(button: animal, color: .brownGrey, font: .Light)
        setBtn(button: disabled, color: .brownGrey, font: .Light)
        setBtn(button: environment, color: .brownGrey, font: .Light)
        setBtn(button: emergency, color: .brownGrey, font: .Light)
        
        if !sender.isSelected {
            sender.titleLabel?.font = .Bold
            sender.setTitleColor(.JackBlack, for: .normal)
            
//            var paramIndex: Int = 0
            switch sender.currentTitle {
            case "어린이":
                scroll(index: 0)
                paramIndex = 0
            case "어르신":
                scroll(index: 1)
                paramIndex = 1
            case "동물":
                scroll(index: 2)
                paramIndex = 2
            case "장애우":
                scroll(index: 3)
                paramIndex = 3
            case "환경":
                scroll(index: 4)
                paramIndex = 4
            case "긴급구조":
                scroll(index: 5)
                paramIndex = 5
            default:
                break
            }
            getFilteredList(category: paramIndex, filter: arrangeIndex)
        }
    }
    func getFilteredList (category: Int, filter: Int){
        MainService.shared.getFilterdList(category, filter) {
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            
            switch data {
            case .success(let data):
                print(data)
                self.infoSet = (data.self as? [Main])!
                self.donationInfoView.reloadData()
            default:
                break
            }
        }
    }
    //Bolding Arrange
    @IBAction func selectArrange(_ sender: UIButton) {
        setBtn(button: upToDate, color: .brownGrey, font: .Light2)
        setBtn(button: highDonated, color: .brownGrey, font: .Light2)
        setBtn(button: lowDonated, color: .brownGrey, font: .Light2)
        
        if !sender.isSelected {
            sender.titleLabel?.font = .Medium2
            sender.setTitleColor(.JackBlack, for: .normal)
            
            // switch 사용해서 통신 !
            switch sender.currentTitle {
            case "최신순":
                arrangeIndex = 0
                break
            case "기부율 높은순":
                arrangeIndex = 1
                break
            case "기부율 낮은순":
                arrangeIndex = 2
                break
            default:
                break
            }
            getFilteredList(category: paramIndex, filter: arrangeIndex)
        }
    }
    
    // 선택되어 넘어온 카테고리 보여주기 셀!
    @IBAction func showMenu(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenu")as? UISideMenuNavigationController else {return}
        
        navigationController?.show(dvc, sender: self)
    }
    @IBAction func goHome(_ sender: Any) {
        backHome()
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
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
        setBtn(button: child, color: .brownGrey, font: .Light)
        setBtn(button: senior, color: .brownGrey, font: .Light)
        setBtn(button: animal, color: .brownGrey, font: .Light)
        setBtn(button: disabled, color: .brownGrey, font: .Light)
        setBtn(button: environment, color: .brownGrey, font: .Light)
        setBtn(button: emergency, color: .brownGrey, font: .Light)
        
        switch indexPath.item {
        case 3:
            setBtn(button: disabled, color: .JackBlack, font: .Bold)
        default:
            break
        }
    }
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail")as? DetailVC else {return}
        let info = infoSet[indexPath.row]
        print(info.start)
        print(info.finish)
        dvc.paramThumbImg = info.thumbnail
        dvc.paramTitle = info.title
        dvc.paramInstitution = info.centerName
//        dvc.paramDate = info.
        dvc.paramProcess = info.percentage
        dvc.paramGoal = info.maxBerry
        dvc.paramDonated = info.totalBerry
        dvc.paramId = info.id

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
        cell.thumbImg.imageFromUrl(gsno(List.thumbnail), defaultImgPath: "imgHomeJjack")
//        cell.date.text = List.date
        cell.title.text = List.title
        cell.processRate.text = String(List.percentage) + "%"
        cell.institution.text = List.centerName
//        cell.processRate.text = String(List.percentage) + "%"
        cell.donatedBerry.text = String(List.maxBerry)
        
        let rate = Double(List.percentage)
        let length = Double(cell.statusBar.frame.width)
        let num = round(length * (rate / 100.0))
        if num >= length {
            cell.showRate.constant = CGFloat(length)
        } else{
            cell.showRate.constant = CGFloat(num)
        }
        return cell
    }
    
    
}
extension MainVC {
//    func setInfoData() {
//        let info1 = Info(thumbnail: "icCard", date: "D - 41", title: "올 겨울 혜리에게도 따뜻한 이불을 주세요!",institution: "사회 복지관", processRate: "50", donatedBerry: "404,040", status: nil)
//        let info2 = Info(thumbnail: "icCard", date: "D - 32", title: "올 겨울 혜리에게도 따뜻한 이불을 주세요!",institution: "샬롬 요양원", processRate: "70", donatedBerry: "404,040", status: nil)
//        let info3 = Info(thumbnail: "icCard", date: "D - 321", title: "올 겨울 혜리에게도 따뜻한 이불을 주세요!", institution: "주남바다요양센터", processRate: "20", donatedBerry: "404,040", status: nil)
//
//        self.infoSet = [info1, info2, info3]
//    }
    func setBtn(button: UIButton, color: UIColor, font: UIFont) {
        button.titleLabel?.font = font
        button.setTitleColor(color, for: .normal)
    }
}

