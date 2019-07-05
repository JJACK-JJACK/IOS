//
//  RankingVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class RankingVC: UIViewController {

    @IBOutlet weak var topTenListView: UICollectionView!
    
    let topTenList: [UIImage] = []
    
    @IBOutlet weak var categoryTopten: UITableView!
    
    var cateTopten: [Ranking] = []
    
    
    @IBOutlet weak var allCate: UIButton!
    @IBOutlet weak var animal: UIButton!
    @IBOutlet weak var environment: UIButton!
    @IBOutlet weak var child: UIButton!
    @IBOutlet weak var disabled: UIButton!
    @IBOutlet weak var senior: UIButton!
    @IBOutlet weak var emergency: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topTenListView.dataSource = self
        topTenListView.delegate = self
        
        categoryTopten.dataSource = self

        
        setup()
        setData()
    }
    func setup() {
        setBorder()
        makeRoundBorder()
    }
    func setBorder () {
        self.allCate.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
        self.animal.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
        self.environment.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
        self.child.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
        self.disabled.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
        self.senior.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
        self.emergency.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
    }
    func makeRoundBorder () {
        self.allCate.makeRounded(cornerRadius: nil)
        self.animal.makeRounded(cornerRadius: nil)
        self.environment.makeRounded(cornerRadius: nil)
        self.child.makeRounded(cornerRadius: nil)
        self.disabled.makeRounded(cornerRadius: nil)
        self.senior.makeRounded(cornerRadius: nil)
        self.emergency.makeRounded(cornerRadius: nil)
    }
    
    @IBAction func showTopTenList(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
        }
        
        switch sender.currentTitle {
        case "전체":
            deselected(button1: nil, button2: animal, button3: environment, button4: child, button5: disabled, button6: senior, button7: emergency)
        case "동물":
            deselected(button1: allCate, button2: nil, button3: environment, button4: child, button5: disabled, button6: senior, button7: emergency)
        case "환경":
            deselected(button1: allCate, button2: animal, button3: nil, button4: child, button5: disabled, button6: senior, button7: emergency)
        case "어린이":
            deselected(button1: allCate, button2: animal, button3: environment, button4: nil, button5: disabled, button6: senior, button7: emergency)
        case "장애우":
            deselected(button1: allCate, button2: animal, button3: environment, button4: child, button5: nil, button6: senior, button7: emergency)
        case "어르신":
            deselected(button1: allCate, button2: animal, button3: environment, button4: child, button5: disabled, button6: nil, button7: emergency)
        case "긴급구조":
            deselected(button1: allCate, button2: animal, button3: environment, button4: child, button5: disabled, button6: senior, button7: nil)
        default:
            break
        }
        showSelectedState(button: allCate)
        showSelectedState(button: animal)
        showSelectedState(button: environment)
        showSelectedState(button: child)
        showSelectedState(button: disabled)
        showSelectedState(button: senior)
        showSelectedState(button: emergency)
    }
    
    @IBAction func showMenu(_ sender: Any) {
        showMenu()
    }
    @IBAction func goHome(_ sender: Any) {
        backHome()
    }
}
extension RankingVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topTenListView.dequeueReusableCell(withReuseIdentifier: "RankingCell", for: indexPath )as! HomeCell
//        let topList = topTenList[indexPath.row]
//        cell.categoryImg.image = topList
        cell.backgroundColor = .mainCol
        cell.makeRounded(cornerRadius: 8.0)
        return cell
    }
}
extension RankingVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 100
        let height: CGFloat = 111

        return CGSize(width: width, height: height)
    }
    // minimumLineSpacingForSectionAt 은 수직 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }
    // insetForSectionAt 섹션 내부 여백을 말합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 20,  left: 20, bottom: 19, right: 20)
    }
//

    
}
extension RankingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cateTopten.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTopten.dequeueReusableCell(withIdentifier: "Ranking")as! RankingCell
        let topTenList = cateTopten[indexPath.row]
        
        cell.rank.text = topTenList.rank
        cell.profileImg.image = UIImage(named: topTenList.profileImg)
        cell.name.text = topTenList.name
        cell.donatedBerry.text = topTenList.donatedBerry + "베리"
        cell.visitCount.text = topTenList.viewCount + "회"
        
        return cell
        
    }
    
    
}


extension RankingVC {
    func deselected (button1: UIButton?, button2: UIButton?, button3: UIButton?, button4: UIButton?, button5: UIButton?, button6: UIButton?, button7: UIButton?){
        
        button1?.isSelected = false
        button2?.isSelected = false
        button3?.isSelected = false
        button4?.isSelected = false
        button5?.isSelected = false
        button6?.isSelected = false
        button7?.isSelected = false
    }
    
    func showSelectedState (button: UIButton) {
        if button.isSelected {
            button.backgroundColor = .mainCol
            button.setBorder(borderColor: nil, borderWidth: 0.0)
            button.titleLabel?.font = .Bold3
        } else {
            button.backgroundColor = .white
            button.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
            button.titleLabel?.font = .Medium
        }
    }
    func setData () {
        let top1 = Ranking(rank: "1등", profileImg: "icCard" , name: "모상일", donatedBerry: "123", viewCount: "3434")
        let top2 = Ranking(rank: "2등", profileImg: "icAnimal" , name: "모상일", donatedBerry: "123", viewCount: "3434")
        cateTopten = [top1, top2]
    }
}
