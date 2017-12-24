//
//  DetailTableViewCell.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/8/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit



class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
