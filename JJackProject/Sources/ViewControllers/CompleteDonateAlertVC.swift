//
//  CompleteDonateAlertVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class CompleteDonateAlertVC: UIViewController {

    @IBOutlet weak var checkStampBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.checkStampBtn.makeRounded(cornerRadius: nil)
        self.skipBtn.makeRounded(cornerRadius: nil)
    }
    
    
    @IBAction func goMyStamps(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "Record", bundle: nil).instantiateViewController(withIdentifier: "Record")as? RecordedDonationVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    @IBAction func back(_ sender: Any) {
        backHome()
    }
    
}
