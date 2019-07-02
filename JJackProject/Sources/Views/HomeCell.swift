//
//  HomeCell.swift
//  JJackProject
//
//  Created by SangIl Mo on 03/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg.layer.cornerRadius = 8
        categoryImg.layer.masksToBounds = true
    }
}
