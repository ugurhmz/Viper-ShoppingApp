//
//  HomeBuilder.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation
import UIKit

class HomeBuilder {
    
    static func createModule(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        //let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        //let view = storyboard.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        
        let view = HomeVC()
        view.title = "Fresh Groceries"
        
        // class's
        let homeInteractor = HomeInteractor(service: WebService.shared, database: RealmDataBase.shared)
        let router = HomeRouter(view: view)
        
        let cartInteractor = CartInteractor(database: RealmDataBase.shared)
        let presenter = HomePresenter(view: view, useCase: (
            getGroceries: homeInteractor.getGroceries,
            addToCart: cartInteractor.addToCart,
            getCartItem: cartInteractor.getCartItem
                
        ), router:  router)
        
        view.presenter = presenter
        return factory(view)
    }
}
