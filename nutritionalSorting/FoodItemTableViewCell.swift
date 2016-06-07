//
//  FoodItemTableViewCell.swift
//  nutritionalSorting
//
//  Created by Maris Kapualani Kali on 11/18/15.
//  Copyright © 2015 Maris Kapualani Kali. All rights reserved.
//

import UIKit
import CoreData

class FoodItemTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var valLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
