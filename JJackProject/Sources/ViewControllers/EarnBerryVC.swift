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
                    self.stamp1.isHidden = false
                    break
                case 2:
                    self.stamp2.isHidden = false
                    break
                case 3:
                    self.stamp3.isHidden = false
                    break
                case 4:
                    self.stamp4.isHidden = false
                    break
                case 5:
                    self.stamp5.isHidden = false
                    break
                case 6:
                    self.stamp6.isHidden = false
                    break
                case 7:
                    self.stamp7.isHidden = false
                    break
                case 8:
                    self.stamp8.isHidden = false
                    break
                case 9:
                    self.stamp9.isHidden = false
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

extension EarnBerryVC {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.view.makeRounded(cornerRadius: 8.0)
    }
}
