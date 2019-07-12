//
//  EarnBerryVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class EarnBerryVC: UIViewController {

    @IBOutlet weak var stamp1: UIImageView!
    @IBOutlet weak var stamp2: UIImageView!
    @IBOutlet weak var stamp3: UIImageView!
    @IBOutlet weak var stamp4: UIImageView!
    @IBOutlet weak var stamp5: UIImageView!
    @IBOutlet weak var stamp6: UIImageView!
    @IBOutlet weak var stamp7: UIImageView!
    @IBOutlet weak var stamp8: UIImageView!
    @IBOutlet weak var stamp9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupStamp()
        getMyStamp()
    }
    func setupStamp() {
        self.stamp1.isHidden = true
        self.stamp2.isHidden = true
        self.stamp3.isHidden = true
        self.stamp4.isHidden = true
        self.stamp5.isHidden = true
        self.stamp6.isHidden = true
        self.stamp7.isHidden = true
        self.stamp8.isHidden = true
        self.stamp9.isHidden = true
    }
    
    // 스탬프 개수 확인 및 스탬프 이미지 넣기
    func getMyStamp(){
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        StampServices.shared.getStamp(token) {
            (data) in
            switch data {
            case .success(let data):
                guard let stmp  = data as? GetStamp else {return}
                print(stmp.cntStamp)
                switch stmp.cntStamp {
                case 1:
                    self.showStamps(self.stamp1, nil, nil, nil, nil, nil, nil, nil, nil)
                    break
                case 2:
                    self.showStamps(self.stamp1, self.stamp2, nil, nil, nil, nil, nil, nil, nil)
                    break
                case 3:
                    self.showStamps(self.stamp1, self.stamp2, self.stamp3, nil, nil, nil, nil, nil, nil)
                    break
                case 4:
                    self.showStamps(self.stamp1, self.stamp2, self.stamp3, self.stamp4, nil, nil, nil, nil, nil)
                    break
                case 5:
                    self.showStamps(self.stamp1, self.stamp2, self.stamp3, self.stamp4, self.stamp5, nil, nil, nil, nil)
                    break
                case 6:
                    self.showStamps(self.stamp1, self.stamp2, self.stamp3, self.stamp4, self.stamp5
                        , self.stamp6, nil, nil, nil)
                    break
                case 7:
                    self.showStamps(self.stamp1, self.stamp2, self.stamp3, self.stamp4, self.stamp5
                        , self.stamp6, self.stamp7, nil, nil)
                    break
                case 8:
                    self.showStamps(self.stamp1, self.stamp2, self.stamp3, self.stamp4, self.stamp5
                        , self.stamp6, self.stamp7, self.stamp8, nil)

                    break
                case 9:
                    self.showStamps(self.stamp1, self.stamp2, self.stamp3, self.stamp4, self.stamp5
                        , self.stamp6, self.stamp7, self.stamp8, self.stamp9)

                    break
                default:
                    self.setupStamp()
                }
                break
            default:
                break
                
            }
        }
    }
    
    
    
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// 스탬프 보여주기 Extension
extension EarnBerryVC {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.view.makeRounded(cornerRadius: 8.0)
    }
    func showStamps (_ stamp1_: UIImageView?, _ stamp2_: UIImageView?, _ stamp3_: UIImageView?, _ stamp4_: UIImageView?, _ stamp5_: UIImageView?, _ stamp6_: UIImageView?, _ stamp7_: UIImageView?, _ stamp8_: UIImageView?, _ stamp9_: UIImageView?) {
        stamp1_?.isHidden = false
        stamp2_?.isHidden = false
        stamp3_?.isHidden = false
        stamp4_?.isHidden = false
        stamp5_?.isHidden = false
        stamp6_?.isHidden = false
        stamp7_?.isHidden = false
        stamp8_?.isHidden = false
        stamp9_?.isHidden = false
    }
}
