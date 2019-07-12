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
    
    var recordList = [HistoryList]()
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
                self.recordList = (data.self as? [HistoryList])!
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
                print(self.eachRecordBerry.count)
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
        let List = recordList[indexPath.row]
//        let berry = eachRecordBerry[index]

        
        cell.thumbImg.imageFromUrl(self.gsno(List.thumbnail), defaultImgPath:"imgHomeJjack")
        cell.title.text = List.title
        cell.institution.text = List.centerName
        cell.processRate.text = String(List.percentage) + "%"
//        cell.donatedBerry.text = String(berry.berry)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let index = List.start.index(List.start.startIndex, offsetBy: 10)
        
        let start = dateFormatter.date(from: String((List.start[..<index])))
        let finish = dateFormatter.date(from: String((List.finish[..<index])))
        
        let interval = finish!.timeIntervalSince(start!)
        let days = Int(interval / 86400)
        print(days)
        if finish! >= Date() {
            print(days)
            cell.date.text = "D - " + String(days)
        }

        
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
//        let berryInfo = eachRecordBerry[indexPath.row]
        
        dvc.paramThumbImg = info.thumbnail
        dvc.paramTitle = info.title
        dvc.paramInstitution = info.centerName
        dvc.paramProcess = info.percentage
//        dvc.paramDonated = berryInfo.berry
        dvc.paramStatus = info.state
        dvc.paramGoal = info.maxBerry
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let index = info.start.index(info.start.startIndex, offsetBy: 10)
        
        let start = dateFormatter.date(from: String((info.start[..<index])))
        
        let finish = dateFormatter.date(from: String((info.finish[..<index])))
        let interval = finish!.timeIntervalSince(start!)
        
        let days = Int(interval / 86400)
        print(days)
        if finish! >= Date() {
            print(days)
            dvc.paramDate = String(days)
        }
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}
