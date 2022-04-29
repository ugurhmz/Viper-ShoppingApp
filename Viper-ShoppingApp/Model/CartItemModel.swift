//
//  CartItem.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


struct CartItemModel {
    let prdId: String
    let value: Int
    
    init(prdId: String, value: Int){
        self.prdId = prdId
        self.value = value
    }
}
