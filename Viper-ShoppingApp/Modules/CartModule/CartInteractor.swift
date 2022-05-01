//
//  CartInteractor.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import Foundation




class CartInteractor {
    
    var database: CartDbProtocol
    
    init(database: CartDbProtocol) {
        self.database = database
    }
    
    func getCartCount(closure: @escaping (Int) -> (Void) ) {
        self.database.getCount(closure: closure)
    }
    
    // addToCart
    func addToCart(prdItem: PrdItem) -> Bool {
        
        guard prdItem.quantity > 0 else {
            return self.database.delete(fromCart: prdItem.prdId)
        }
        
       return self.database.updateCart(using: CartItemModel(prdId: prdItem.prdId, value: prdItem.quantity))
    }
    
    func getCartItem(prdId: Int) -> CartItemModel {
        return self.database.gertCartItem(usingPrdId: prdId)
    }
    
}
