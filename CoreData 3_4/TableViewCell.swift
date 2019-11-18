//
//  TableViewCell.swift
//  CoreData 3_4
//
//  Created by iOS TeamLead on 4/3/19.
//  Copyright © 2019 iOS TeamLead. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblCiy: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
