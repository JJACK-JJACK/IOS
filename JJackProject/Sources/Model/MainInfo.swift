//
//  MainInfo.swift
//  JJackProject
//
//  Created by SangIl Mo on 03/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation

struct MainInfo {
    var thumbImg: String
    var date: String
    var title: String
    var processRate: String
    var donatedBerry: String
    
    init(thumbnail: String, date: String, title: String, processRate: String, donatedBerry: String){
        self.thumbImg = thumbnail
        self.date = date
        self.title = title
        self.processRate = processRate
        self.donatedBerry = donatedBerry
    }
}
