//
//  SideMenuVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var useInfo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    

    func setup() {
        self.useInfo.setBorder(borderColor: UIColor.veryLightPink, borderWidth: 1.0)
        self.useInfo.makeRounded(cornerRadius: 15.5)
    }
    @IBAction func goHome(_ sender: Any) {
        backHome()
    }
    
    @IBAction func showHistory(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "UseHistoryVC") as? UseHistoryVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func showMyPage(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPage")as? MyPageVC else {return}
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func cancelMenu(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
