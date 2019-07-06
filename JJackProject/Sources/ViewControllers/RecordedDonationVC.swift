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

    var recordList: [Info] = []
    @IBOutlet weak var myRecordView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myRecordView.delegate = self
        myRecordView.dataSource = self
        // Do any additional setup after loading the view.
        setData()

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // deselectRow after click
        
        if let index = myRecordView.indexPathForSelectedRow {
            myRecordView.deselectRow(at: index, animated: true)
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
        
        
        cell.thumbImg.image = UIImage(named: List.thumbImg)
        cell.status.text = List.status
        cell.date.text = List.date
        cell.title.text = List.title
        cell.institution.text = List.institution
        cell.processRate.text = List.processRate + "%"
        cell.donatedBerry.text = List.donatedBerry
        
        let rate = Double(List.processRate) ?? 0.0
        let num = round(197 * (rate / 100.0))
        cell.showRate.constant = CGFloat(num)
        
        let status = cell.status.text
        switch status {
        case "진행중":
            cell.status.backgroundColor = .pointCol
            cell.date.textColor = .pointCol
            cell.processRate.textColor = .pointCol
            cell.activateBar.backgroundColor = .pointCol
        case "마감":
            cell.status.backgroundColor = .closeCol
            cell.date.textColor = .closeCol
            cell.processRate.textColor = .closeCol
            cell.activateBar.backgroundColor = .closeCol
        case "전달완료":
            cell.status.backgroundColor = .completeCol
            cell.date.textColor = .completeCol
            cell.processRate.textColor = .completeCol
            cell.activateBar.backgroundColor = .completeCol
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
        
        dvc.paramStatus = info.status ?? ""
        dvc.paramThumbImg = info.thumbImg
        dvc.paramTitle = info.title
        dvc.paramInstitution = info.institution
        dvc.paramDate = info.date ?? ""
        dvc.paramProcess = info.processRate
        dvc.paramDonated = info.donatedBerry
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}
extension RecordedDonationVC {
    func setData () {
        let record1 = Info(thumbnail: "icCard", date: "D - 43", title: "올겨울 혜리에게도 따듯한 이불을 주세요!", institution: "주남바다요양센터", processRate: "69", donatedBerry: "20", status: "진행중")
        let record2 = Info(thumbnail: "icCard", date: nil, title: "올겨울 혜리에게도 따듯한 이불을 주세요!", institution: "주남바다요양센터", processRate: "100", donatedBerry: "100", status: "마감")
        let record3 = Info(thumbnail: "icCard", date: nil, title: "올겨울 혜리에게도 따듯한 이불을 주세요!", institution: "주남바다요양센터", processRate: "90", donatedBerry: "240", status: "전달완료")
        self.recordList = [record1, record2, record3]
    }
}
