//
//  RecordedDonationVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 04/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit
import SideMenu

class RecordedDonationVC: UIViewController {

    @IBOutlet weak var MyDonate: UILabel!
    @IBOutlet weak var MyDonateBerry: UILabel!
    
    var recordList = [Main]()
    var eachRecordBerry = [MyEachDonatedBerry]()
    @IBOutlet weak var myRecordView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myRecordView.delegate = self
        myRecordView.dataSource = self
        // Do any additional setup after loading the view.
//        setData()

        
        getMyHistory()
        getDonatedHistory()
        getEachDonatedBerry()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // deselectRow after click
        
        if let index = myRecordView.indexPathForSelectedRow {
            myRecordView.deselectRow(at: index, animated: true)
        }
    }
    func getMyHistory () {
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        HistoryService.shared.getMyHistory(token) {
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            switch data {
            case .success(let data):
                guard let data = data as? MyHistory else {return}
                self.MyDonate.text = String(data.donate)
                self.MyDonateBerry.text = String(data.donateBerry)
                self.view.reloadInputViews()
                break
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("path")
            case .serverErr:
                print("server")
            case .networkFail:
                print("network")
            }
        }
    }
    func getDonatedHistory (){
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        HistoryService.shared.getDonatedList(token) {
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            switch data {
            case .success(let data):
                self.recordList = (data.self as? [Main])!
                self.myRecordView.reloadData()
                print(data)
                print("성공")
            default:
                break
            }
            
        }
    }
    func getEachDonatedBerry (){
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        HistoryService.shared.getEachDonatedBerry(token){
            [weak self]
            (data) in
            
            guard let `self` = self else {return}
            switch data {
            case .success(let data):
                self.eachRecordBerry = (data.self as? [MyEachDonatedBerry])!
                self.myRecordView.reloadData()
                print(data)
                print("성공")
            default:
                break
            }
            
        }
    }

    @IBAction func showMenu(_ sender: Any) {
        showMenu()
    }
    @IBAction func goHome(_ sender: Any) {
        backHome()
    }
    
}
extension RecordedDonationVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myRecordView.dequeueReusableCell(withIdentifier: "RecordView")as! RecordCell
        let index = indexPath.row
        print(index)
        let List = recordList[index]
        print(index)
        let berry = eachRecordBerry[index]
        print(index)
        
        
        
//        cell.thumbImg.image = UIImage(named: List.thumbImg)
//        cell.status.text = List.status
//        cell.date.text = List.date
//        cell.title.text = List.title
//        cell.institution.text = List.institution
//        cell.processRate.text = List.processRate + "%"
//        cell.donatedBerry.text = List.donatedBerry
        
        cell.thumbImg.imageFromUrl(self.gsno(List.thumbnail), defaultImgPath:"imgHomeJjack")
//        cell.status.text = String(List.state)
//        cell.date.text s나중에
        cell.title.text = List.title
        cell.institution.text = List.centerName
        cell.processRate.text = String(List.percentage) + "%"
        cell.donatedBerry.text = String(berry.berry)
        
        let rate = Double(List.percentage)
        let width = Double(cell.statusBar.frame.width)
        let num = round(width * (rate / 100.0))
        if num >= width {cell.showRate.constant =  CGFloat(width)}
        else {cell.showRate.constant = CGFloat(num)}
        
        let status = List.state
        switch status {
        case 0:
            cell.status.backgroundColor = .pointCol
            cell.date.textColor = .pointCol
            cell.processRate.textColor = .pointCol
            cell.activateBar.backgroundColor = .pointCol
            cell.status.text = "진행중"
        case 1:
            cell.status.backgroundColor = .closeCol
            cell.date.textColor = .closeCol
            cell.processRate.textColor = .closeCol
            cell.activateBar.backgroundColor = .closeCol
            cell.status.text = "마감"
        case 2:
            cell.status.backgroundColor = .completeCol
            cell.date.textColor = .completeCol
            cell.processRate.textColor = .completeCol
            cell.activateBar.backgroundColor = .completeCol
            cell.status.text = "전달완료"
        default:
            break
        }
        
        return cell
    }
}
extension RecordedDonationVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail")as? DetailRecordVC else {return}
        
        let info = recordList[indexPath.row]
        let berryInfo = eachRecordBerry[indexPath.row]
        
//        dvc.paramStatus = info.status ?? ""
//        dvc.paramThumbImg = info.thumbImg
//        dvc.paramTitle = info.title
//        dvc.paramInstitution = info.institution
//        dvc.paramDate = info.date ?? ""
//        dvc.paramProcess = info.processRate
//        dvc.paramDonated = info.donatedBerry
        
        dvc.paramThumbImg = info.thumbnail
        dvc.paramTitle = info.title
        dvc.paramInstitution = info.centerName
//        dvc.paramDate =
        dvc.paramProcess = info.percentage
        dvc.paramDonated = berryInfo.berry
        dvc.paramStatus = info.state
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}
extension RecordedDonationVC {
//    func setData () {
//        let record1 = Info(thumbnail: "icCard", date: "D - 43", title: "올겨울 혜리에게도 따듯한 이불을 주세요!", institution: "주남바다요양센터", processRate: "69", donatedBerry: "20", status: "진행중")
//        let record2 = Info(thumbnail: "icCard", date: nil, title: "올겨울 혜리에게도 따듯한 이불을 주세요!", institution: "주남바다요양센터", processRate: "100", donatedBerry: "100", status: "마감")
//        let record3 = Info(thumbnail: "icCard", date: nil, title: "올겨울 혜리에게도 따듯한 이불을 주세요!", institution: "주남바다요양센터", processRate: "90", donatedBerry: "240", status: "전달완료")
//        self.recordList = [record1, record2, record3]
//    }
}
