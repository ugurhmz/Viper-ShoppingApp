//
//  CartyModuleBuilder.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import Foundation
import UIKit

class CartModuleBuilder {
    
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Cart", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        
        view.title = "Cart"
        
        return factory(view)
    }
    
}

