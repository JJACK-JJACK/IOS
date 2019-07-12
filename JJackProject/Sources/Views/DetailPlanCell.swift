//
//  DetailPlanCell.swift
//  JJackProject
//
//  Created by SangIl Mo on 12/07/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

class DetailPlanCell: UITableViewCell {

    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var indexView: UIView!
    @IBOutlet weak var purpose: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.indexView.makeRounded(cornerRadius: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
