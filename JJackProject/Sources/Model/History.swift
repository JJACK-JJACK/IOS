//
//  History.swift
//  JJackProject
//
//  Created by SangIl Mo on 02/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import Foundation
import UIKit

struct History{
    var purpose: String
    var date: String
    var institution: String?
    var berry: String
    
    init(purpose: String, date: String, institution: String?, berry: String) {
        self.purpose = purpose
        self.date = date
        self.institution = institution
        self .berry = berry
    }
}
