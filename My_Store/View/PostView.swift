//
//  PostView.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class PostView: UIView {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var olderCost: CustomLabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var nameProduct: UILabel!
    static var instanceFromNib: PostView {
        return UINib(nibName: "PostView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PostView
    }
    func set(post: Product) {
        imageProduct.image = post.image
        cost.text = post.cost
    }
    
    @IBAction func like(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
