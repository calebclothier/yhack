//
//  CartViewController.swift
//  Under9
//
//  Created by Caleb Clothier on 12/2/18.
//  Copyright © 2018 Caleb Clothier. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var itemCell: UICollectionViewCell!
    var cart = [String: String]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension CartViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cart.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! UICollectionViewCell
//        cell.t = String(indexPath.row + 1)
//        return cell
//    }
//}
