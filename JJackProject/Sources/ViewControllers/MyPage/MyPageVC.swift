//
//  MyPageVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 01/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {

    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // SideMenu 열기
    @IBAction func openMenu(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenuVC")as? SideMenuVC else { return }
        navigationController?.pushViewController(dvc, animated: true)
    }
    // Nickname, email 다음 뷰로 넘겨주기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "goEditSegue":
            let sendNickname = self.nickName.text
            let sendEmail = self.email.text
            let dvc = segue.destination as! EditAccoutVC
            dvc.paramName = sendNickname!
            dvc.paramEmail = sendEmail!
        default:
            break
        }
    }

}
