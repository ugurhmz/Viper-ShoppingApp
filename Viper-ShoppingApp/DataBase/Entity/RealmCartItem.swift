//
//  RealmCartItem.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation
import RealmSwift


class RealmCartItem: Object {
    
    @objc dynamic var prdId: Int = 0
    @objc dynamic var value: Int = 0
    @objc dynamic var updated: Date = Date()
    
    override static func primaryKey() -> String? {
        return "prdId"
    }
}


//MARK: -
extension RealmCartItem {
    
    convenience init(cartItem: CartItemModel){
        self.init()
        self.prdId = cartItem.prdId
        self.value = cartItem.value
    }
}



//MARK: -
extension CartItemModel {
    init(realmCartItem: RealmCartItem) {
        self.prdId = realmCartItem.prdId
        self.value = realmCartItem.value
    }
}
