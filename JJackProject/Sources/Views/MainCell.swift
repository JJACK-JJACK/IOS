//
//  MainCell.swift
//  JJackProject
//
//  Created by SangIl Mo on 03/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var institution: UILabel!
    @IBOutlet weak var processRate: UILabel!
    @IBOutlet weak var donatedBerry: UILabel!
    
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var activateBar: UIView!
    @IBOutlet weak var showRate: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.statusBar.makeRounded(cornerRadius: nil)
        self.activateBar.makeRounded(cornerRadius: nil)
    
        self.thumbImg.layer.masksToBounds = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
