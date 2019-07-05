//
//  RankingCell.swift
//  JJackProject
//
//  Created by SangIl Mo on 05/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class RankingCell: UITableViewCell {
    
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var donatedBerry: UILabel!
    @IBOutlet weak var visitCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImg.makeRounded(cornerRadius: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
