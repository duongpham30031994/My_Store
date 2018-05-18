//
//  DataServices.swift
//  My_Store
//
//  Created by Apple on 5/17/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import CoreData

class DataServices {
    static let shared: DataServices = DataServices()
    // MARK: - Fetched results controller
    
    var fetchedResultsController: NSFetchedResultsController<CategoryProduct> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<CategoryProduct> = CategoryProduct.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: AppDelegate.context, sectionNameKeyPath: nil, cacheName: "Master")
        do {
            try _fetchedResultsController!.performFetch()
            if _fetchedResultsController?.fetchedObjects?.count == 0 {
                loadSample()
                try _fetchedResultsController!.performFetch()
            }
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    private var _fetchedResultsController: NSFetchedResultsController<CategoryProduct>?
    
    func saveContext() {
        // Save the context.
        guard let context = _fetchedResultsController?.managedObjectContext else { return }
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    private func loadSample() {
        guard let context = _fetchedResultsController?.managedObjectContext else { return }
        
        let onlyOnlyChic = Product(name: "ONLY ONLCHIC", cost: "500.000đ", image: #imageLiteral(resourceName: "1"))
        let hilfigerDenimLALA = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "2"))
        let veroModaVMPRETTY = Product(name: "Vero Moda VMPRETTY", cost: "500.000đ", image: #imageLiteral(resourceName: "9"))
        let evenOddTop = Product(name: "Even&Odd Top", cost: "500.000đ", image: #imageLiteral(resourceName: "11"))
        let a = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "7"))
        let b = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "3"))
        let c = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "4"))
        let d = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "6"))
        let e = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "8"))
        let f = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "12"))
        let g = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "10"))
        let h = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "5"))
        let i = Product(name: "Hilfiger Denim LALA", cost: "500.000đ", image: #imageLiteral(resourceName: "1"))
        
        let productsTopAndTshirt: [Product] = [onlyOnlyChic, hilfigerDenimLALA, veroModaVMPRETTY, evenOddTop]
        let sportClothing = [a, b, c, d]
        let blousesAndTunics = [e, f, g, h, i]
        
        let productsTopAndTshirtEntity = CategoryProduct(context: context)
        productsTopAndTshirtEntity.name = "Tops & Tshirts"
        productsTopAndTshirtEntity.products = productsTopAndTshirt
        
        let sportClothingEntity = CategoryProduct(context: context)
        sportClothingEntity.name = "Sports Clothing"
        sportClothingEntity.products = sportClothing
        
        let blouseEntity = CategoryProduct(context: context)
        blouseEntity.name = "Blouses & Tunics"
        blouseEntity.products = blousesAndTunics
        
        saveContext()
    }
}
