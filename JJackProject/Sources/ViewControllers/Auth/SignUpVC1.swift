//
//  SignUpVC1.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SignUpVC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goNext(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SettingPwd") as? SignUpVC2 else { return }
        
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
//    @IBAction func unwindToMain (segue: UIStoryboardSegue) {
//    }
    
    
}
