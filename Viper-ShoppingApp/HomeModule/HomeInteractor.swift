//
//  HomeInteractor.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


typealias PrdItem = (prdId: String, quantity: Int)

protocol HomeInteractorProtocol {
    //func getTitleFromDB() -> HomeModel
    func getGroceries(completion: GroceriesClosure) -> (Void)
    //func addToCart(prdItem: PrdItem) -> (Bool)
}


class HomeInteractor: HomeInteractorProtocol {
    
    var service: GroceriesAPI
    init(service: GroceriesAPI){
        self.service = service
    }
    
    
    // get all
    func getGroceries(completion: (GroceryResult) -> (Void)) {
        self.service.fetchGroceries { (result) in
            print("result")
            completion(result)
        }
    }
    
    
//    // addToCart
//    func addToCart(prdItem: PrdItem) -> Bool {
//       return self.database.updateCart(using: CartItem(prdId: prdItem.prdId, value: prdItem.quantity))
//    }
//
}

