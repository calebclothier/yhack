//
//  RestaurantViewController.swift
//  Under9
//
//  Created by Caleb Clothier on 12/1/18.
//  Copyright © 2018 Caleb Clothier. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let inventory = ["Naked Pressed": "5.50",
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
    
    @IBOutlet weak var backButton: UINavigationItem!
    @IBOutlet weak var budgetLabel: UILabel!
    var restaurantName: String?
    var budget: Float?
    var filteredInventory = [String : String]()
    var cart = [String : String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        budgetLabel.layer.masksToBounds = true
        budgetLabel.layer.cornerRadius = 10
        self.filteredInventory = inventory
        
        if restaurantName == "Durfee's" || restaurantName == "KBT Cafe" || restaurantName == "Bass Cafe" {
            budget = 9.00
            budgetLabel.text = "$" + String(format: "%.02f", budget!)
        } else {
            budgetLabel.text = "N/A"
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = restaurantName
        
    }
    
    func checkData() -> [String: String] {
        let filtInv = inventory.filter{ Float(truncating: NumberFormatter().number(from: $0.value)!) < self.budget!}
        return filtInv
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if restaurantName != "Durfee's" {
            return 1
        } else {
            return self.filteredInventory.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        if restaurantName != "Durfee's" {
            cell.textLabel!.text = "Coming Soon!"
            cell.detailTextLabel!.text = ":)"
            return cell
        } else {
            let product = Array(self.filteredInventory.keys)[indexPath.row]
            let price = Array(self.filteredInventory.values)[indexPath.row]
            cell.textLabel!.text = product
            cell.detailTextLabel!.text = "$"+price
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = Array(self.filteredInventory.keys)[indexPath.row]
        let price = Float(truncating: NumberFormatter().number(from: Array(self.filteredInventory.values)[indexPath.row])!)
        self.budget = self.budget! - price
        budgetLabel!.text = "$" + String(format: "%.02f", budget!)
        self.cart[product] = budgetLabel!.text
        self.filteredInventory = checkData()
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? CartViewController {
            destinationViewController.cart = self.cart
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
