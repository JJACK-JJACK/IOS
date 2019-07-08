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
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topTenListView.dataSource = self
        topTenListView.delegate = self
        
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
//        let List = topTenList[indexPath.row]
//        dvc.paramThumbImg = List
        
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
    
//    func showSelectedState (button: UIButton) {
//        if button.isSelected {
//            button.backgroundColor = .mainCol
//            button.setBorder(borderColor: nil, borderWidth: 0.0)
//            button.titleLabel?.font = .Bold3
//        } else {
//            button.backgroundColor = .white
//            button.setBorder(borderColor: .brownGrey, borderWidth: 1.0)
//            button.titleLabel?.font = .Medium
//        }
//    }
}
