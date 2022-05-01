//
//  HomeInteractor.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


typealias PrdItem = (prdId: Int, quantity: Int)


class HomeInteractor{
    
    var service: GroceriesAPI
    var database: CartDbProtocol
    
    init(service: GroceriesAPI, database: CartDbProtocol){
        self.service = service
        self.database = database
    }
    
    // get all
    func getGroceries(completion: (GroceryResult) -> (Void)) {
        self.service.fetchGroceries { (result) in
            print("result")
            completion(result)
        }
    }
    
    
    

}

