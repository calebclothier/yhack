//
//  RestaurantViewController.swift
//  Under9
//
//  Created by Caleb Clothier on 12/1/18.
//  Copyright © 2018 Caleb Clothier. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    @IBOutlet weak var backButton: UINavigationItem!
    @IBOutlet weak var budgetLabel: UILabel!
    var restaurantName: String?
    
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
    
    func checkData() {
        let inventory = ["Naked Pressed": "5:50",
                         "Tropicana 12 oz": "2.25",
                         "Kevita":"4.75",
                         "Gatorade Shake": "4.75",
                         "Metro Deli Chips": "1.75",
                         "Cheetos": "1.10",
                         "Lays Classic Chips": "1.60",
                         "Chicken Tenders": "5.95",
                         "Chapstick": "2.50",
                         "Nature Valley": "1.50",
                         "Apple": "0.60",
                         "Banana": "0.70",
                         "Oatmeal": "3.50",
                         "Campbells": "4.00"]
        for (key, value) in inventory {
            if Float(value) < Float(budgetLabel.text) {
                
            }
        }
        
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
}
