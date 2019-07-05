//
//  Ranking.swift
//  JJackProject
//
//  Created by SangIl Mo on 05/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation

struct Ranking {
    var rank: String
    var profileImg: String
    var name: String
    var donatedBerry: String
    var viewCount: String
    
    init(rank: String, profileImg: String, name: String, donatedBerry: String, viewCount: String) {
        self.rank = rank
        self.profileImg = profileImg
        self.name = name
        self.donatedBerry = name
        self.viewCount = viewCount
        
    }
}
