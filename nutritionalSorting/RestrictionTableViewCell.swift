//
//  RestrictionTableViewCell.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/23/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit

class RestrictionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
