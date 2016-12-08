//
//  CategoryTableViewCell2.swift
//  timetrackr
//
//  Created by Nada Al-Alusi on 12/5/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class CategoryTableViewCell2: UITableViewCell {

    @IBOutlet weak var categoryLabel2: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    var category: Category?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
