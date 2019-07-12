//
//  Ranking.swift
//  JJackProject
//
//  Created by SangIl Mo on 05/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation

struct Ranking {
    var profileImg: String
    var name: String
    var donatedBerry: String
    var viewCount: String
    
    init(profileImg: String, name: String, donatedBerry: String, viewCount: String) {
        self.profileImg = profileImg
        self.name = name
        self.donatedBerry = name
        self.viewCount = viewCount
        
    }
}
