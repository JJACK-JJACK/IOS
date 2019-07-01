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
    // setting boarder color
    func setBorderColorOfButton () {
        toSignup.setBorder(borderColor: UIColor.pointCol, borderWidth: 1.0)
    }
    // setting the radius
    func setBorderRadius() {
        toSignin.makeRounded(cornerRadius: 4.0)
        toSignup.makeRounded(cornerRadius: 4.0)
    }
    
    // set when view did load
    func setup() {
        setBorderColorOfButton()
        setBorderRadius()
    }
    @IBAction func button(_ sender: Any) {
        
    }
}

