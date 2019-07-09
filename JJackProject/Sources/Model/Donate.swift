//
//  Donate.swift
//  JJackProject
//
//  Created by SangIl Mo on 09/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
struct Donate: Codable {
    var program: [Program]
    var id: String
    var userId: Int
    
    enum CodingKeys: String, CodingKey{
        case program
        case id = "_id"
        case userId = "user_id"
    }
}

struct Program: Codable {
    var programId: String
    var date: Date
    var donateBerry: Int
}
