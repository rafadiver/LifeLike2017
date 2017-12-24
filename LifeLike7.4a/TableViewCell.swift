//
//  TableViewCell.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/6/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var celldescription: UILabel!
    @IBOutlet weak var cellCiudad: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
