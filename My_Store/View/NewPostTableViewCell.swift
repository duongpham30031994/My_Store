//
//  NewPostTableViewCell.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class NewPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: NewPostTableViewCellDelegate?
    var posts: [Product]?
    var section: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: "SmallPost", bundle: nil), forCellWithReuseIdentifier: "smallPost")
        collectionView.setup_horizotal(numberOfItems: 3, padding: 10)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func set(posts: [Product], at indexPath: IndexPath) {
        self.posts = posts
        section = indexPath
        collectionView.reloadData()
    }

}

extension NewPostTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "smallPost", for: indexPath) as! SmallPostCollectionViewCell
        let post = (posts ?? [])[indexPath.row]
        cell.imagePost.image = post.image
        cell.namePost.text = post.name
        cell.costPost.text = post.cost
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if section != nil {
            delegate?.collectionView(didSelectItemIn: section, at: indexPath)
        }
    }
}
