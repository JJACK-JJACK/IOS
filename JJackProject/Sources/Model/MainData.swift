//
//  MainData.swift
//  JJackProject
//
//  Created by SangIl Mo on 10/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
struct Main: Codable {
    let totalBerry, maxBerry, percentage: Int
    let id, title, centerName: String
    let thumbnail: String
    let start, finish: String
    let state: Int
    
    enum CodingKeys: String, CodingKey{
        case totalBerry, maxBerry, percentage
        case id = "_id"
        case title, centerName
        case thumbnail
        case start, finish
        case state
    }
}
