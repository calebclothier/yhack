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
}
