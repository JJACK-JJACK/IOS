//
//  ViewController.swift
//  JJackProject
//
//  Created by SangIl Mo on 25/06/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toSignin: UIButton!
    @IBOutlet weak var toSignup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    func setBorderColorOfButton () {
        toSignup.setBorder(borderColor: UIColor.mainCol, borderWidth: 1.0)
    }
    func setBorderRadius() {
        toSignin.makeRounded(cornerRadius: 4.0)
        toSignup.makeRounded(cornerRadius: 4.0)
    }
    func setup() {
        setBorderColorOfButton()
        setBorderRadius()
    }
}

