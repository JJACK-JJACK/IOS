//
//  UIViewController+Extensions.swift
//  JJackProject
//
//  Created by SangIl Mo on 25/06/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit
import SideMenu

// UIViewController Extension
extension UIViewController {
    
    // UIAlertController without handler
    func simpleAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // UIAlertController with Handler
    func simpleAlertwithHandler(title: String, message: String, okHandler : ((UIAlertAction) -> Void)?, cancleHandler : ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default, handler: okHandler)
        let cancelAction = UIAlertAction(title: "취소",style: .cancel, handler: cancleHandler)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Set Custom Back Button
    func setBackBtn(){
        
        // 백버튼 이미지 파일 이름에 맞게 변경해주세요.
        let backBTN = UIBarButtonItem(image: UIImage(named: "icBack"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(self.pop))
        navigationItem.leftBarButtonItem = backBTN
//        navigationItem.leftBarButtonItem?.tintColor = color
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    // pop func
    @objc func pop(){
        self.navigationController?.popViewController(animated: true)
    }
    
    // Set NavigationBar Background Clear without underline
    func setNavigationBarClear() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    // Set NavigationBar Background Clear with underline
    func setNavigationBarShadow() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.backgroundColor = UIColor.white
    }
    
    func setupSideMenu () {
        // Side Menu 의 애니메이션을 지정합니다.
        // 옵션은 .menuSlideIn, .viewSlideOut, viewSlideInOut, .menuDissolveIn 이 있습니다.
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        
        // Side Menu 의 이펙트를 지정합니다. 하나하나 바꿔보세요.
        // 옵션은 .extraLight, .light, .dark, .regular, .prominent, nil 이 있습니다.
        SideMenuManager.default.menuBlurEffectStyle = nil
        
        // Side Menu 가 보일 때 기존 ViewController 의 투명도
        // 0.0 ~ 1.0
        SideMenuManager.default.menuAnimationFadeStrength = 0
        // Side Menu 의 투명도
        // 0.0 ~ 1.0
        SideMenuManager.default.menuShadowOpacity = 0.3
        // Side Menu 가 보일 때 기존 ViewController 의 크기
        // 0.001 ~ 2.0
        SideMenuManager.default.menuAnimationTransformScaleFactor = 1
        // Side Menu 의 Width
        // 0 ~ self.view.frame.width
        SideMenuManager.default.menuWidth = view.frame.width
        // Side Menu 의 Status Bar 에 대한 침범 여부를 결정합니다.
        // true - 침범하지 않음, false - 침범함
        SideMenuManager.default.menuFadeStatusBar = false
        
    }
    
    func backHome() {
        performSegue(withIdentifier: "goHome", sender: self)
    }
    func showMenu() {
        guard let dvc = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenu") as? UISideMenuNavigationController else {return}
        
        navigationController?.show(dvc, sender: self)

    }
    
    func gsno(_ value: String?) -> String{
        guard let value_ = value else {
            return ""
        }
        return value_
    }
    
    func gino(_ value: Int?) -> Int{
        guard let value_ = value else {
            return 0
        }
        return value_
    }//func gino
    
    func gbno(_ value: Bool?) -> Bool{
        guard let value_ = value else {
            return false
        }
        return value_
    }//func gbno
    
    func gfno(_ value: Float?) -> Float{
        guard let value_ = value else{
            return 0
        }
        return value_
    }//func gfno
    
}
