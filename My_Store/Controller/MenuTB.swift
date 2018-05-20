//
//  MenuTB.swift
//  My_Store
//
//  Created by Apple on 5/19/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MenuTB: UITableViewController {
    
    @IBOutlet weak var avatar_img: UIImageView!
    @IBOutlet weak var info_UserFB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatar_img.layer.cornerRadius = avatar_img.frame.size.width / 2
        avatar_img.clipsToBounds = true
        //        info_UserFB.text = UserDefaults.standard.string(forKey: "name")
        DataServices.shared.getUserInfo {[unowned self] user in
            self.info_UserFB.text = user.name
            self.avatar_img.download(from: user.image)
        }
    }
}
