//
//  UICollectionView + Extensions.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

extension UICollectionView {
    func setup_horizotal(numberOfItems: CGFloat, padding: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        let widthScreen = UIScreen.main.bounds.size.width
        let width = (widthScreen - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        layout.itemSize = CGSize(width: width, height: 160)
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .horizontal
        self.collectionViewLayout = layout
    }
    
    func setup_vertical(numberOfItems: CGFloat, padding: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        let widthScreen = UIScreen.main.bounds.size.width
        let width = (widthScreen - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        layout.itemSize = CGSize(width: width, height: width * 2)
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .vertical
        self.collectionViewLayout = layout
    }
    
}
