//
//  CartItem.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


struct CartItemModel {
    let prdId: Int
    let value: Int
    
    init(prdId: Int, value: Int){
        self.prdId = prdId
        self.value = value
    }
}
