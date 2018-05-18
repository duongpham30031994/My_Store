//
//  MainViewController.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var homeContainerView: UIView!
    @IBOutlet weak var cloverButton: UIButton!
    @IBOutlet weak var slideMenuContainerView: UIView!
    @IBOutlet weak var leadingConstraintSlideMenu: NSLayoutConstraint!
    
    var isSlideMenuOpen: Bool = false {
        didSet {
            leadingConstraintSlideMenu.constant = isSlideMenuOpen ? 0 : -(0.6 * UIScreen.main.bounds.width + 40)
            cloverButton.isHidden = !isSlideMenuOpen
            UIView.animate(withDuration: 0.35) {
                self.view.layoutIfNeeded()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        leadingConstraintSlideMenu.constant = -(0.6 * UIScreen.main.bounds.width + 40)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func onlickCloverButton(_ sender: UIButton) {
        isSlideMenuOpen = !isSlideMenuOpen
    }
    @IBAction func onlickMenuButton(_ sender: UIBarButtonItem) {
        isSlideMenuOpen = !isSlideMenuOpen
    }
    
}
