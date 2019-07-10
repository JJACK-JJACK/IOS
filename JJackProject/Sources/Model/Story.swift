//
//  Story.swift
//  JJackProject
//
//  Created by SangIl Mo on 08/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
struct Datum: Codable {
    let story: [Story]
    let plan: [Plan]
    let review: [Review]
    let state:Int
    let totalBerry: Int
    let maxBerry: Int
    let percentage: Int
    let id: String
    let title: String
    let centerName: String
    let thumbnail: String
    let start: String
    let finish: String
    let deliver: String
    let categoryID: Int
    
    enum CodingKeys: String, CodingKey {
        case story, plan, state, totalBerry, maxBerry, percentage, review
        case id = "_id"
        case title, centerName, thumbnail, start, finish, deliver
        case categoryID = "categoryId"
    }
}



