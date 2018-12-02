//
//  InventoryStruct.swift
//  Under9
//
//  Created by Caleb Clothier on 12/1/18.
//  Copyright © 2018 Caleb Clothier. All rights reserved.
//

import Foundation

class Inventory {
    let product: String, price: String, type: String
    init(product: String, price: String, type: String) {
        self.product = product
        self.price = price
        self.type = type
    }

let inventoryjson = [{"product":"Naked Pressed", "price":"5.50", "type":"Drink"},
    {"product":"Tropicana 12 oz", "price":"2.25", "type":"Drink"},
    {"product":"Kevita", "price":"4.75", "type":"Drink"},
    {"product":"Gatorade Shake", "price":"4.75", "type":"Drink"},
    {"product":"Metro Deli Chips", "price":"1.75", "type":"Food"},
    {"product":"Cheetos", "price":"1.10", "type":"Food"},
    {"product":"Lays Classic Chips","price": "1.60", "type":"Food"},
    {"product":"Doritos", "price":"1.60", "type":"Food"},
    {"product":"FSTG Chips", "price":"1.60", "type":"Food"},
    {"product":"Pita Chips", "price":"1.60", "type":"Food"}]
