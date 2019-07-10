//
//  Revie.swift
//  JJackProject
//
//  Created by SangIl Mo on 10/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
// MARK: - Review
struct Review: Codable {
    let story: [Story]?
    let plan: [Plan]?
}
