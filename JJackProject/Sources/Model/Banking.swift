//
//  Banking.swift
//  JJackProject
//
//  Created by SangIl Mo on 10/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
struct Banking: Codable {
    let history: [UserHistory]
    let userId: Int
    
    enum CodingKeys: String, CodingKey{
        case history
        case userId = "user_id"
    }
}
