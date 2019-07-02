//
//  EditNicknameVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 02/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class EditNicknameVC: UIViewController {

    @IBOutlet weak var edittingNiknm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edittingNiknm.text = paramName
    }
    
    var paramName: String = " "
    
    @IBAction func deleteTxt(_ sender: Any) {
        self.edittingNiknm.text? = ""
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmEditName (_ sender: Any) {
//        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "EditAccoutVC") as? EditAccoutVC else { return }
        
//        guard let text = edittingNiknm.text else { return }
        
//        dvc.name = self.edittingNiknm.text!
//
//        present(dvc, animated: true, completion: nil)
        
        /* 값 전달이 아니라 서버와 요청이 필요합니다.
            서버 요청으로 값을 page View 에서 바꿔서 수정하는 부분으로 해야 할듯 함*/
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
