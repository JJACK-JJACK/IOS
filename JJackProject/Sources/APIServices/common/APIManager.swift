//
//  APIManager.swift
//  JJackProject
//
//  Created by SangIl Mo on 26/06/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

protocol APIManager {}

extension APIManager {
    static func url(_ path: String) -> String {
        return "http://52.79.49.178:3000" + path
    }
}
