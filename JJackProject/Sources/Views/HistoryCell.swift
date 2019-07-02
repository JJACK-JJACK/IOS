//
//  HistoryCell.swift
//  JJackProject
//
//  Created by SangIl Mo on 02/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var purpose: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var Institution: UILabel!
    @IBOutlet weak var berry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
