//
//  SignUpVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var underBarView: UIView!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var toSignup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    func setBorderRadius() {
        Login.makeRounded(cornerRadius: 4.0)
        toSignup.makeRounded(cornerRadius: 4.0)
    }
    func setBorderColor() {
        
    }
    func setup(){
        setBorderRadius()
        setBorderColor()
    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
}
