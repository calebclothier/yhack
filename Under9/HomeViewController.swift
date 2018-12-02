//
//  HomeViewController.swift
//  Under9
//
//  Created by Caleb Clothier on 12/1/18.
//  Copyright © 2018 Caleb Clothier. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController, UISearchResultsUpdating {
    var unfilteredRestaurantList: [String]?
    var filteredRestaurantList: [String]?
    var selectedRestaurant: String?
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        // Replace with API call for list of restaurant names
        unfilteredRestaurantList = ["Durfee's", "KBT Cafe", "Bass Cafe", "Walmart", "Chapel Mini Mart", "Good Nature Market", "Elm City Market", "Costco", "Peoples Choice Deli", "Stop & Shop"]
        filteredRestaurantList = unfilteredRestaurantList
        
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Stores"
        tableView.tableHeaderView = searchController.searchBar

        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering() {
            return filteredRestaurantList!.count
        }
        return unfilteredRestaurantList!.count
    }

    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        // Configure the cell...
        let restaurant: String
        if isFiltering() {
            restaurant = filteredRestaurantList![indexPath.row]
        } else {
            restaurant = unfilteredRestaurantList![indexPath.row]
        }
        
        cell.textLabel!.text = restaurant
        let distance = Float.random(in: 0.1 ... 4)
        cell.detailTextLabel!.text = String(format: "%.01f", distance) + " mi"
        return cell
    }
    
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    func filterContentForSearchText(_ searchText: String) {
        filteredRestaurantList = unfilteredRestaurantList?.filter({restaurant in
            return restaurant.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
        selectedRestaurant = self.filteredRestaurantList![indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let i = self.tableView.indexPathForSelectedRow?.item,
            let selectedRestaurant = self.filteredRestaurantList?[i] else { return }
        
        if let destinationViewController = segue.destination as? RestaurantViewController {
            destinationViewController.restaurantName = selectedRestaurant
        }
    }

}
