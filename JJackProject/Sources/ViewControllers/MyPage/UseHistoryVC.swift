//
//  UseHistoryVC.swift
//  JJackProject
//
//  Created by SangIl Mo on 02/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class UseHistoryVC: UIViewController {

    @IBOutlet weak var historyTable: UITableView!
    
    var historyList = [UserHistory]()
    
    @IBOutlet weak var ownBerry: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setHistoryData()
        historyTable.dataSource = self
        
        getBanking()
//        getMyOwnBerry()
        setup()
    }
    func setup() {
        self.ownBerry.text = String(UserDefaults.standard.integer(forKey: "ownBerry"))
    }
    func getBanking (){
        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
        
        MyPageService.shared.getBanking(token) {
            [weak self]
            (data) in
            guard let `self` = self else {return}
            
            switch data {
            case .success(let data):
                guard let bank = data.self as? Banking else {return}
                let userData = bank.history
                self.historyList = userData
                self.historyTable.reloadData()
                break
            default:
                break
            }
        }
    }
    
//    func getMyOwnBerry () {
//        guard let token = UserDefaults.standard.string(forKey: "refreshToken") else {return}
//        ChargeService.shared.ownedBerry(token){
//            [weak self]
//            (data) in
//            guard let `self` = self else {return}
//            
//            switch data {
//            case .success(let data):
//                guard let berry = data as? Int else {return}
//                self.ownBerry.text = String(berry)
//                UserDefaults.standard.set(berry, forKey: "ownBerry")
//                print(berry)
//            default:
//                break
//            }
//        }
//    }
//    

    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension UseHistoryVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTable.dequeueReusableCell(withIdentifier: "HistoryCell")as! HistoryCell
        
        let history = historyList[indexPath.row]
        
//        cell.purpose.text = history.
        cell.date.text = history.date
        cell.Institution.text = history.centerName
        cell.berry.text = history.berry
        
        switch history.title {
        case "기부":
            cell.purpose.text = "기부"
            cell.berry.textColor = .pointCol
        case "충전":
            cell.purpose.text = "충전"
            cell.berry.textColor = .mainCol
        default:
            break
        }
        
        return cell
    }
    
    
}

extension UseHistoryVC {
//    func setHistoryData (){
//        let history1 = History(purpose: "기부", date: "2019.06.02", institution: "우리집", berry: "101010")
//        let history2 = History(purpose: "충전", date: "2019.06.02", institution: nil, berry: "10102")
//        let history3 = History(purpose: "기부", date: "2019.06.23", institution: "우리집", berry: "10333")
//        let history4 = History(purpose: "기부", date: "2019.06.02", institution: "우리집", berry: "101010")
//        let history5 = History(purpose: "충전", date: "2019.06.342", institution: nil, berry: "1010")
//        let history6 = History(purpose: "기부", date: "2019.06.02", institution: "우리집", berry: "101010")
//        historyList = [history1,history2,history3,history4,history5,history6]
//    }
    
}
