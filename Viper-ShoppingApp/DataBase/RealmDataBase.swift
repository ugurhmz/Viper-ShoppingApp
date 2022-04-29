//
//  RealmDataBase.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation





class RealmDataBase: CartDbProtocol {
    
    static let shared: RealmDataBase = RealmDataBase()
    private init() {}
    
    func updateCart() -> (Bool) {
        return true
    }
    
}
