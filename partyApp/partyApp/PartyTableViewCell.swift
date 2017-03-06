//
//  PartyTableViewCell.swift
//  partyApp
//
//  Created by Yi on 16/12/4.
//  Copyright © 2016年 Yi. All rights reserved.
//

import UIKit

class PartyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
