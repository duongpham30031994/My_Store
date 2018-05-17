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
    var posts: [Post]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.setup(numberOfItems: 3, padding: 10)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(posts: [Post], at indexPath: IndexPath) {
//        collectionView.setup(numberOfItems: 3, padding: 10)
        self.posts = posts
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
}

extension UICollectionView {
    func setup(numberOfItems: CGFloat, padding: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        let widthScreen = UIScreen.main.bounds.size.width
        let width = (widthScreen - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        layout.itemSize = CGSize(width: width, height: 160)
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .horizontal
        self.collectionViewLayout = layout
    }
}
