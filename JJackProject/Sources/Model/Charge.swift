//
//  Charge.swift
//  JJackProject
//
//  Created by SangIl Mo on 10/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
struct Charge: Codable {
    let charge: [ChargingInfo]
    let id: String
    let userId: Int?
    
    enum CodingKeys: String, CodingKey{
        case charge
        case id = "_id"
        case userId = "user_id"
    }
    
}
struct ChargingInfo: Codable {
    let date: String
    let chargeBerry: Int
}
