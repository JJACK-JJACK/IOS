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
    
    @IBOutlet weak var nickName1: UILabel!
    @IBOutlet weak var nickName2: UILabel!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    // 값을 전달 받을 parameter 생성
    var paramName: String = ""
    var paramEmail: String = ""
    
    // 초기화면 세팅
    func setup() {
        self.profileImg.makeRounded(cornerRadius: nil)
        self.nickName1.text = paramName
        self.nickName2.text = paramName
        self.email.text = paramEmail
    }
   
    // Nickname 다음 뷰로 넘겨주기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier{
        case "EdittingNicknameSegue":
            let sendName = self.paramName
            let dvc = segue.destination as! EditNicknameVC
            dvc.paramName = sendName
        default:
            break
        }
    }
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
