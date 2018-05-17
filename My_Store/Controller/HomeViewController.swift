//
//  HomeViewController.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let fetchedResultsController = DataServices.shared.fetchedResultsController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = Product(name: "Áo bra ren có dây", cost: "60.000d", image: #imageLiteral(resourceName: "ao ren"))
        let headerView = PostView.instanceFromNib
        headerView.set(post: post)
        tableView.tableHeaderView = headerView
        
        tableView.tableHeaderView?.frame.size = CGSize(width: tableView.frame.width, height: 300)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (fetchedResultsController.sections?[section].numberOfObjects ?? 0) * 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexPathCategory = indexPath.row % 2 == 0 ? IndexPath(row: indexPath.row/2, section: indexPath.section) : IndexPath(row: (indexPath.row-1)/2, section: indexPath.section)
        
        let categoryProduct = fetchedResultsController.object(at: indexPathCategory)
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as! HeaderTableViewCell
            cell.nameCategory.text = categoryProduct.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewPostTableViewCell
            cell.set(posts: categoryProduct.products ?? [], at: indexPathCategory)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row % 2 == 0 ? 44 : 200
    }
}
