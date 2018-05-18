//
//  AllProductViewController.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class AllProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static var instance : AllProductViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "AllProductViewController") as! AllProductViewController
    }
    
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var indexPathForSelected: IndexPath!
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "SmallPost", bundle: nil), forCellWithReuseIdentifier: "smallPost")
        collectionView.setup_vertical(numberOfItems: 2, padding: 10)
        // Do any additional setup after loading the view.
        if indexPathForSelected != nil {
            products = DataServices.shared.fetchedResultsController.object(at: indexPathForSelected).products ?? []
            collectionView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smallPost", for: indexPath) as! SmallPostCollectionViewCell
        cell.imagePost.image = products[indexPath.row].image
        cell.namePost.text = products[indexPath.row].name
        cell.costPost.text = products[indexPath.row].cost
        return cell
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

