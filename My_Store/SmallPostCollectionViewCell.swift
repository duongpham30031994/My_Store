//
//  SmallPostCollectionViewCell.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class SmallPostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var namePost: UILabel!
    @IBOutlet weak var costPost: UILabel!
    
    @IBAction func like(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    
}
