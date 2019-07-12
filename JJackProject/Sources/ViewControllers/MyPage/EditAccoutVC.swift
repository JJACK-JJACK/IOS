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
        
        picker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        paramName = UserDefaults.standard.string(forKey: "nickname")!
        setup()
    }
    
    // 값을 전달 받을 parameter 생성
    var paramName: String = ""
    var paramEmail: String = ""
    var paramProfileImg: UIImage?
    
    let picker = UIImagePickerController()
    
    func openLibrary () {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    func openCamera() {
        if (UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }else {
            print("접근 불가")
        }
    }
    
    // 초기화면 세팅
    func setup() {
        self.profileImg.makeRounded(cornerRadius: nil)
        self.nickName1.text = paramName
        self.nickName2.text = paramName
        self.email.text = paramEmail
        self.profileImg.image = paramProfileImg
    }
   
    @IBAction func editProfileImg(_ sender: Any) {
        let AlertController = UIAlertController(title: "프로필 수정", message: "원하는 작업을 선택하세요.", preferredStyle: .actionSheet)
        let albumImg = UIAlertAction(title: "사진앨범", style: .default) {
            (action) in
            self.openLibrary()
        }
        let photo = UIAlertAction(title: "카메라", style: .default) {
            (action) in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        AlertController.addAction(albumImg)
        AlertController.addAction(photo)
        AlertController.addAction(cancel)
        present(AlertController, animated: true)
        
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
extension EditAccoutVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        if let image = info[(UIImagePickerController.InfoKey).originalImage]as? UIImage {
            self.profileImg.image = image
//            self.paramProfileImg = image
        }
//        if let url = info[UIImagePickerController.InfoKey.imageURL]as? URL{
//            print("##################################URL")
//            print(url)
//        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
