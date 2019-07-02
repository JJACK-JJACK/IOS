//
//  SignUpVC2.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SignUpVC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goNext(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SettingNickname")as? SignUpVC3 else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
