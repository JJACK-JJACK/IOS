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
    
    @IBOutlet weak var EntireDonatedBerry: UILabel!
    
    var topTenList = [Datum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topTenListView.dataSource = self
        topTenListView.delegate = self
        
        get10Rank()
        getEntireBerry()
        
        
        
    }
    // 전체 기부된 베리 가져오기
    func getEntireBerry() {
        MainService.shared.getEntireDonatedBerry(){
            [weak self]
            (data) in
            guard let `self` = self else {return}
            
            switch data {
            case .success(let data):
                let berry = (data as? [EntireBerry])!
                print(berry[0].totalDonate)
                self.EntireDonatedBerry.text = String(berry[0].totalDonate)
                break
            default:
                break
            }
            
        }
    }
    
    // 10개 기부 후기 가져오기 - 후기 넣어야 한다.
    func get10Rank() {
        RankingService.shared.getRanking() {
            [weak self]
            (data) in
            guard let `self` = self else {return}
            
            switch data {
            case .success(let data):
                let datum = (data as? [Datum])!
                self.topTenList = datum
                print("Ssssssssssssssss")
                print(self.topTenList.count)
                self.topTenListView.reloadData()
                break
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("path")
            case .serverErr:
                print("server")
            case .networkFail:
                print("network")
            }
        }
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
        return topTenList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topTenListView.dequeueReusableCell(withReuseIdentifier: "RankingCell", for: indexPath )as! HomeCell
        let topList = topTenList[indexPath.row]
        cell.categoryImg.imageFromUrl(self.gsno(topList.thumbnail), defaultImgPath: "imgHomeJjack")
        cell.makeRounded(cornerRadius: 8.0)
        return cell
    }
}
extension RankingVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = view.frame.width - 119
        let height: CGFloat = width * (375.0 / 266.0)

        return CGSize(width: width, height: height)
    }
    // minimumLineSpacingForSectionAt 은 수직 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 9
    }
    // insetForSectionAt 섹션 내부 여백을 말합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 20,  left: 20, bottom: 40, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "DetailRanking")as? DetailRankingVC else {return}
        let List = topTenList[indexPath.row]
        dvc.paramThumbImg = List.thumbnail
        dvc.process = List.percentage
        dvc.berry = List.totalBerry
        dvc.max = List.maxBerry
        
        let reviewStory = List.review?[0].story!
        dvc.subTitle = reviewStory?[0].subTitle ?? "준비중입니다."
        dvc.content1 = reviewStory?[0].content[0] ?? "준비중입니다."
        dvc.content2 = reviewStory?[0].content[1] ?? "준비중입니다."
        dvc.contentImg = reviewStory?[0].img ?? "imgHomeJjack"
        let reviewPlan = List.review?[1].plan!
        dvc.purpose1 = reviewPlan?[0].purpose ?? ""
        dvc.price1 = reviewPlan?[0].price ?? 0
        
        dvc.plans = reviewPlan ?? []
        
        
        navigationController?.pushViewController(dvc, animated: true)
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
    
}
