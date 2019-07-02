//
//  MainVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 03/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let imageSet: [UIImage] = [
        (UIImage(named: "icHamburger"))!,
        (UIImage(named: "icHamburger"))!,
        (UIImage(named: "icHamburger"))!,
        (UIImage(named: "icHamburger"))!,
        (UIImage(named: "icHamburger"))!,
        (UIImage(named: "icHamburger"))!
    ]

    @IBOutlet weak var mainView: UICollectionView!
    
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
        
        setBoldCategory(response: parmaIndex)
        
    }
    
    func setBoldCategory (response: Int) {
        switch response {
        case 0:
            self.child.titleLabel?.font = .Bold
            self.child.titleLabel?.textColor = .JackBlack
        case 1:
            self.senior.titleLabel?.font = .Bold
            self.senior.titleLabel?.textColor = .JackBlack
        case 2:
            self.animal.titleLabel?.font = .Bold
            self.animal.titleLabel?.textColor = .JackBlack
        case 3:
            self.disabled.titleLabel?.font = .Bold
            self.disabled.titleLabel?.textColor = .JackBlack
        case 4:
            self.environment.titleLabel?.font = .Bold
            self.environment.titleLabel?.textColor = .JackBlack
        case 5:
            self.emergency.titleLabel?.font = .Bold
            self.emergency.titleLabel?.textColor = .JackBlack
        default:
             break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        collectionView.cellForItem
    }
    @IBAction func goHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        print(indexPath.row)
    //    }
}
extension UIFont {
    
    class var Bold: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 20.0)!
    }
}
