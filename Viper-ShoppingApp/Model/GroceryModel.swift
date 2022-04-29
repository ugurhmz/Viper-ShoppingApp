//
//  GroceryModel.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


public struct GroceryResult: Decodable {
    public var groceries: [GroceryInfo]
}



public struct GroceryInfo : Decodable {
    public var id : Int?
    public var title : String?
    public var prdImage : String?
    public var descriptions : String?
    public var price : Double?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "prd_id"
        case title = "title"
        case prdImage  = "prd_image"
        case descriptions  = "descriptions"
        case price = "price"
  
    }
    
}
