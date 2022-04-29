//
//  WebService.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


typealias GroceriesClosure = (GroceryResult) -> (Void)


protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) -> (Void)
}


class WebService: GroceriesAPI {
    
    static let shared = WebService()
    private init() {}
    
    
    //  Get ALL
    func fetchGroceries(completion: (GroceryResult) -> (Void)) {
        
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
        
            do {
                
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(GroceryResult.self, from: data)
                completion(groceryResult)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}

