//
//  Token.swift
//  JJackProject
//
//  Created by SangIl Mo on 07/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation

struct  Token: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: String?
}
