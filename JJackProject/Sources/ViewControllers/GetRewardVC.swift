//
//  GetRewardVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 11/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit
import Lottie

class GetRewardVC: UIViewController {
    @IBOutlet weak var reward: UILabel!
    
    @IBOutlet weak var enterBtn: UIButton!
    @IBOutlet weak var showText: UILabel!
    @IBOutlet weak var showNum: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 로티 설정
        let giveRewardAnimationView = AnimationView(name: "berrydata2")
        giveRewardAnimationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        giveRewardAnimationView.center = self.view.center
        giveRewardAnimationView.contentMode = .scaleAspectFit
        
        self.view.addSubview(giveRewardAnimationView)
        
        giveRewardAnimationView.loopMode = .playOnce
        giveRewardAnimationView.animationSpeed = 1.0
        giveRewardAnimationView.play()
        
        self.reward.text = String(rewardBerry)
        self.enterBtn.makeRounded(cornerRadius: 8.0)
        
        self.showText.isHidden = true
        self.showNum.isHidden = true
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let time = DispatchTime.now() + .seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.showText.isHidden = false
            self.showNum.isHidden = false
        }
    }
    
    var rewardBerry: Int = 0
    
    
    @IBAction func goHome(_ sender: Any) {
        backHome()
    }
}
