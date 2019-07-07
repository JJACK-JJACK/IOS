//
//  SignUpVC3.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SignUpVC3: UIViewController {

    @IBOutlet weak var checkDuplicate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.checkDuplicate.setBorder(borderColor: UIColor(white: 221.0 / 255.0, alpha: 1.0), borderWidth: 1.0)
        self.checkDuplicate.makeRounded(cornerRadius: 8.0)
    }
    

    
    @IBAction func completeSignup(_ sender: UIButton) {
        print("hello")
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
