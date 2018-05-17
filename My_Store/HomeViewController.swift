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
    
    var newPosts: [[Post]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = Post(name: "Áo bra ren có dây", cost: "60.000d", image: #imageLiteral(resourceName: "ao ren"))
        for _ in 0...5 {
            newPosts.append([post, post, post, post])
        }
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
        return newPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewPostTableViewCell
        cell.set(posts: newPosts[indexPath.row], at: indexPath)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
}
