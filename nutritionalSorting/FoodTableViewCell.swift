//
//  FoodTableViewCell.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/12/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    //MARK: properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
