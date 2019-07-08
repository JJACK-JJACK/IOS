//
//  ResponseArray.swift
//  JJackProject
//
//  Created by SangIl Mo on 08/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
struct ResponseArr<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [T]?
}
