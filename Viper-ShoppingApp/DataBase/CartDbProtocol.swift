//
//  CartDB.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


protocol CartDbProtocol {
    func gertCartItem(usingPrdId prdId: Int ) -> CartItemModel
    func updateCart(using cartItem: CartItemModel) -> (Bool)
    func delete(fromCart prdId: Int) -> (Bool)
    func getCount(closure: @escaping  (Int) -> (Void)) -> (Void)
}
