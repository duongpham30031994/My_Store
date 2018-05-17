//
//  Post.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

public class Product: NSObject, NSCoding {

    struct Key {
        static let name = "name"
        static let cost = "cost"
        static let image = "image"
    }
    
    var name: String
    var cost: String
    var image: UIImage
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Key.name)
        aCoder.encode(cost, forKey: Key.cost)
        aCoder.encode(image, forKey: Key.image)
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: Key.name) as? String else { return nil }
        guard let cost = aDecoder.decodeObject(forKey: Key.cost) as? String else { return nil }
        guard let image = aDecoder.decodeObject(forKey: Key.image) as? UIImage else { return nil }
        self.init(name: name, cost: cost, image: image)
    }
    
    init(name: String, cost: String, image: UIImage) {
        self.name = name
        self.cost = cost
        self.image = image
    }
}
