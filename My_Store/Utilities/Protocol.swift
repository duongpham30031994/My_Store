//
//  Protocol.swift
//  My_Store
//
//  Created by Apple on 5/18/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

// 1

protocol HeaderTableViewCellDelegate: class {
    func tableView(didSelectHeaderAt indexPath: IndexPath)
}

protocol NewPostTableViewCellDelegate: class {
    func collectionView(didSelectItemIn section: IndexPath ,at indexPath: IndexPath)
}
