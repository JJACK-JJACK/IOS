//
//  HomeVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 02/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    let imageSet: [UIImage] = [
    (UIImage(named: "icHamburger"))!,
    (UIImage(named: "icHamburger"))!,
    (UIImage(named: "icHamburger"))!,
    (UIImage(named: "icHamburger"))!,
    (UIImage(named: "icHamburger"))!,
    (UIImage(named: "icHamburger"))!
    ]
    
    @IBOutlet weak var pageDot1: UIView!
    @IBOutlet weak var constraint1: NSLayoutConstraint!
    @IBOutlet weak var pageDot2: UIView!
    @IBOutlet weak var constraint2: NSLayoutConstraint!
    @IBOutlet weak var pageDot3: UIView!
    @IBOutlet weak var constraint3: NSLayoutConstraint!
    @IBOutlet weak var pageDot4: UIView!
    @IBOutlet weak var constraint4: NSLayoutConstraint!
    @IBOutlet weak var pageDot5: UIView!
    @IBOutlet weak var constraint5: NSLayoutConstraint!
    @IBOutlet weak var pageDot6: UIView!
    @IBOutlet weak var constraint6: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var HomeView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        HomeView.dataSource = self
        HomeView.delegate = self
        //paging 만들기!
        HomeView.isPagingEnabled = true
        
        self.pageDot1.makeRounded(cornerRadius: nil)
        self.pageDot2.makeRounded(cornerRadius: nil)
        self.pageDot3.makeRounded(cornerRadius: nil)
        self.pageDot4.makeRounded(cornerRadius: nil)
        self.pageDot5.makeRounded(cornerRadius: nil)
        self.pageDot6.makeRounded(cornerRadius: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x: Int = Int(scrollView.contentOffset.x / view.frame.width)
        switch x {
        case 0:
            selectDot(view: pageDot1, constraints: constraint1)
            deselectDot(view: pageDot2, constraints: constraint2)
        case 1:
            selectDot(view: pageDot2, constraints: constraint2)
            deselectDot(view: pageDot1, constraints: constraint1)
            deselectDot(view: pageDot3, constraints: constraint3)
        case 2:
            selectDot(view: pageDot3, constraints: constraint2)
            deselectDot(view: pageDot2, constraints: constraint1)
            deselectDot(view: pageDot4, constraints: constraint3)
        case 3:
            selectDot(view: pageDot4, constraints: constraint2)
            deselectDot(view: pageDot3, constraints: constraint1)
            deselectDot(view: pageDot5, constraints: constraint3)
        case 4:
            selectDot(view: pageDot5, constraints: constraint2)
            deselectDot(view: pageDot4, constraints: constraint1)
            deselectDot(view: pageDot6, constraints: constraint3)
        case 5:
            selectDot(view: pageDot6, constraints: constraint2)
            deselectDot(view: pageDot5, constraints: constraint1)
        default:
            
            break
        }
        
    }
    func selectDot (view: UIView, constraints: NSLayoutConstraint) {
        UIView.animate(withDuration: 0.5, animations: {
            constraints.constant = 43
            view.backgroundColor = UIColor.mainCol
            self.view.layoutIfNeeded()
        })
    }
    func deselectDot (view: UIView, constraints: NSLayoutConstraint) {
        UIView.animate(withDuration: 0.5, animations: {
            constraints.constant = 12
            view.backgroundColor = UIColor.dotCol
            self.view.layoutIfNeeded()
        })
    }

}
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath)as! HomeCell
        let image = imageSet[indexPath.item]
        
        cell.categoryImg.image = image
//        cell.makeRounded(cornerRadius: 8.0)
        
        return cell
    }
}
extension HomeVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 285
        let height: CGFloat = 328
        
        return CGSize(width: width, height: height)
    }
    // minimumLineSpacingForSectionAt 은 수직 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    // minimumInteritemSpacingForSectionAt 은 수평 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // insetForSectionAt 섹션 내부 여백을 말합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainVC else {return}
            dvc.parmaIndex = indexPath.row
            present(dvc, animated: true, completion: nil)
        }
}
