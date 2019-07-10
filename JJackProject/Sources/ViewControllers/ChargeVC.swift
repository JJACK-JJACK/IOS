//
//  ChargeVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 06/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class ChargeVC: UIViewController{

    @IBOutlet weak var control1: UIButton!
    @IBOutlet weak var control2: UIButton!
    @IBOutlet weak var control3: UIButton!
    @IBOutlet weak var control4: UIButton!
    @IBOutlet weak var control5: UIButton!
    
    @IBOutlet weak var select1: UIView!
    @IBOutlet weak var select2: UIView!
    @IBOutlet weak var select3: UIView!
    @IBOutlet weak var select4: UIView!
    @IBOutlet weak var select5: UIView!
    
    @IBOutlet weak var bankAccount: UILabel!
    
    var pickerData: [String] = [String]()
    
    var chargeData: Charge?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerData = ["Item1", "Item2", "Item3", "Item4",]
    
        select1.isHidden = false
        
        setup()
    }
    
    var paramBerry: Int = 1100
    var paramAccount: String? = ""
    
    func setup () {
        setViewDesign()
        setSelection()
        setTagButton()
    }
    func setViewDesign () {
        settingView(sel: select1, control: control1)
        settingView(sel: select2, control: control2)
        settingView(sel: select3, control: control3)
        settingView(sel: select4, control: control4)
        settingView(sel: select5, control: control5)
    }
    func setSelection () {
        select2.isHidden = true
        select3.isHidden = true
        select4.isHidden = true
        select5.isHidden = true
    }
    func setTagButton () {
        control1.tag = 1
        control2.tag = 2
        control3.tag = 3
        control4.tag = 4
        control5.tag = 5
    }
    @IBAction func showpicker(_ sender: Any) {
        let message = "\n\n\n\n\n\n"
        let alert = UIAlertController(title: "Please Select City", message: message, preferredStyle: .actionSheet)
        alert.isModalInPopover = false
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: view.frame.width - 30, height: 140)) // CGRectMake(left, top, width, height) - left and top are like margins
        pickerFrame.tag = 555
        //set the pickers datasource and delegate
        pickerFrame.delegate = self
//        pickerFrame.dataSource = self
        
        //Add the picker to the alert controller
        alert.view.addSubview(pickerFrame)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //Perform Action
        })
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func SelectAmountOfBerry(_ sender: UIButton) {
        select1.isHidden = true
        setSelection()
        switch sender.tag {
        case 1:
            select1.isHidden = false
            self.paramBerry = 1100
        case 2:
            select2.isHidden = false
            self.paramBerry = 5500
        case 3:
            select3.isHidden = false
            self.paramBerry = 11000
        case 4:
            select4.isHidden = false
            self.paramBerry = 33000
        case 5:
            select5.isHidden = false
            self.paramBerry = 55000
        default:
            break
        }
        print(paramBerry)
    }
    
    @IBAction func ChargeBerry(_ sender: Any) {
        //통신
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        
        ChargeService.shared.chargingBerry(token, paramBerry) {
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            
            switch data {
            case .success(let data):
                self.chargeData = (data.self as? Charge)!
                guard let chargeInfo = self.chargeData?.charge else {return}
                let endIndex = chargeInfo.endIndex
                let chargedBerry = chargeInfo[endIndex + -1].chargeBerry
                print("####################2222#######")
                print(chargedBerry)
                UserDefaults.standard.set(chargedBerry, forKey: "myBerry")
                break
            case .requestErr(let message):
                print(message)
            case .pathErr:
                print("path")
            case .serverErr:
                print("server")
            case .networkFail:
                print("네트워크 오류")
            }
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        self.pop()
    }
    
}
extension ChargeVC: UIPickerViewDataSource, UIPickerViewDelegate {
    // picker에서 제공하는 선택 주제 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // picker의 각 선택 주제에 있는 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.paramAccount = pickerData[row]
        self.bankAccount.text = paramAccount
    }

    
}
extension ChargeVC {
    func settingView (sel: UIView, control: UIButton) {
        control.setBorder(borderColor: .mainCol, borderWidth: nil)
        control.makeRounded(cornerRadius: nil)
        sel.makeRounded(cornerRadius: nil)
    }
}
