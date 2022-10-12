//
//  TableViewCell.swift
//  UMC_Week4_Standard
//
//  Created by 077tech on 2022/10/12.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
