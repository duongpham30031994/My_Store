//
//  HeaderTableViewCell.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    // protocol 2
    weak var delegate: HeaderTableViewCellDelegate?

    @IBOutlet weak var nameCategory: UILabel!
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // protocol 3
    @IBAction func showAll(_ sender: UIButton) {
        if indexPath != nil {
            delegate?.tableView(didSelectHeaderAt: indexPath)
        }
    }
    
    
}
