//
//  Post.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class Post {
    var name: String
    var cost: String
    var image: UIImage
    init(name: String, cost: String, image: UIImage) {
        self.name = name
        self.cost = cost
        self.image = image
    }
}
