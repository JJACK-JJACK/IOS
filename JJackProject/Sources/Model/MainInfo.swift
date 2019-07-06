//
//  MainInfo.swift
//  JJackProject
//
//  Created by SangIl Mo on 03/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation

struct Info {
    var thumbImg: String
    var date: String?
    var title: String
    var institution: String
    var processRate: String
    var donatedBerry: String
    var status: String?
    
    init(thumbnail: String, date: String?, title: String, institution: String, processRate: String, donatedBerry: String, status: String?){
        self.thumbImg = thumbnail
        self.date = date
        self.title = title
        self.institution = institution
        self.processRate = processRate
        self.donatedBerry = donatedBerry
        self.status = status
    }
}
