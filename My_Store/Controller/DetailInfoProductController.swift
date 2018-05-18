//
//  DetailInfoProductController.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DetailInfoProductController: UIViewController {
    
    static var instance : DetailInfoProductController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "DetailInfoProductController") as! DetailInfoProductController
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbname: UILabel!
    @IBOutlet weak var lbCost: UILabel!
    var section: IndexPath!
    var indexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        if section != nil && indexPath != nil {
            let products = DataServices.shared.fetchedResultsController.object(at: section).products ?? []
            img.image = products[indexPath.row].image
            lbname.text = products[indexPath.row].name
            lbCost.text = products[indexPath.row].cost
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
