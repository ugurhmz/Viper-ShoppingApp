//
//  RealmDataBase.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation
import RealmSwift




class RealmDataBase: CartDbProtocol {
    
    static let shared: RealmDataBase = RealmDataBase()
    private init() {}
    
    func updateCart(using cartItem: CartItemModel) -> (Bool) {
        
        let realm = try! Realm()
        
        do {
           
            try realm.write {
                realm.add(RealmCartItem(cartItem: cartItem), update: .all)
            }
        } catch {
            print("db updating err")
            return false
        }
        
        return true
    }
    
}
