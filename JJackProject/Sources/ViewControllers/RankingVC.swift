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
        
        setup()
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
        allCate.backgroundColor = .white
        animal.backgroundColor = .white
        environment.backgroundColor = .white
        child.backgroundColor = .white
        disabled.backgroundColor = .white
        senior.backgroundColor = .white
        emergency.backgroundColor = .white
        setup()
        if !sender.isSelected {
            sender.backgroundColor = .mainCol
            sender.setBorder(borderColor: nil , borderWidth: 0.0 )
            sender.titleLabel?.font = .Bold3
        }
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

extension RankingVC {
    func settingBtn (backGroundCol: UIColor, Font: UIFont) {
        self.view.backgroundColor = .white
        self.view.text
        
    }
}
