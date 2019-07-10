//
//  Donate.swift
//  JJackProject
//
//  Created by SangIl Mo on 09/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
struct Donate: Codable {
    let program: [Program]
    let id: String
    let userId: Int

    enum CodingKeys: String, CodingKey{
        case program
        case id = "_id"
        case userId = "user_id"
    }
}

struct Program: Codable {

    let programId: String
    let date: String
    let donateBerry: Int

    enum CodingKeys: String, CodingKey{
        case programId = "program_id"
        case date
        case donateBerry
    }
}
