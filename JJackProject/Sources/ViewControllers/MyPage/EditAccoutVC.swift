//
//  EditAccoutVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class EditAccoutVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var editImage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        self.profileImg.makeRounded(cornerRadius: nil)
    }
   
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
