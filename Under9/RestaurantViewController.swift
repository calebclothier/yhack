//
//  RestaurantViewController.swift
//  Under9
//
//  Created by Caleb Clothier on 12/1/18.
//  Copyright © 2018 Caleb Clothier. All rights reserved.
//

import UIKit
import CSVImporter

class RestaurantViewController: UIViewController {
    
    @IBOutlet weak var backButton: UINavigationItem!
    @IBOutlet weak var budgetLabel: UILabel!
    var restaurantName: String?
    var inventories: [Inventory]?
    
    override func viewDidLoad() {
        budgetLabel.layer.masksToBounds = true
        budgetLabel.layer.cornerRadius = 10
        
        if restaurantName == "Durfee's" || restaurantName == "KBT Cafe" || restaurantName == "Bass Cafe" {
            budgetLabel.text = "$9.00"
        } else {
            budgetLabel.text = "N/A"
        }

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = restaurantName
        
    }
    
//    func processData() {
//        let path = "Under9/durfeesinventory.csv"
//        let importer = CSVImporter<Inventory>(path: path)
//        importer.startImportingRecords { recordValues -> Inventory in
//            print(recordValues[0])
//            return Inventory(product: recordValues[0], price: recordValues[1], type: recordValues[2])
//
//            }.onFinish { importedRecords in
//
//                for record in importedRecords {
//                    print(record)
//                }
//
//        }
    }
    
    
//    func request() {
//        let urlString:URL = URL(string: "https://ide50-srr46.cs50.io:8080/")!
//
//        guard var request = try? URLRequest(url: urlString, method: .post) else { return }
//        request.httpBody = try? JSONEncoder().encode(["Restaurant": restaurantName!])
//
//        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
//           print("Something happened")
//            guard let data = data,
//                let dict = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
//            print(dict)
////         handleNewData()
//        }
//        dataTask.resume()
//
//        let responseData = [InventoryItem(name: "Hello", price: "World")]
//        handleNewData(data: responseData)
//    }
    
//    func handleNewData(data: [InventoryItem]) {
//        // Fill in table view
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

