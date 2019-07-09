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
    let state, totalBerry, maxBerry, percentage: Int
    let id, title, centerName: String
    let thumbnail: String
    let start, finish, deliver: String
    let categoryID: Int
    
    enum CodingKeys: String, CodingKey {
        case story, plan, state, totalBerry, maxBerry, percentage, review
        case id = "_id"
        case title, centerName, thumbnail, start, finish, deliver
        case categoryID = "categoryId"
    }
}
// MARK: - Plan
struct Plan: Codable {
    let purpose: String
    let price: Int
}

// MARK: - Review
struct Review: Codable {
    let story: [Story]?
    let plan: [Plan]?
}

// MARK: - Story
struct Story: Codable {
    let subTitle: String
    let content: [String]
    let img: String
}
