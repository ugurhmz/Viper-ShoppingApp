//
//  HomeBuilder.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation
import UIKit

class HomeBuilder {
    
    static func createModule(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        //let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        //let view = storyboard.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        
        let view = HomeVC()
        view.title = "Fresh Groceries"
        
        // class's
        let interactor = HomeInteractor(service: WebService.shared)
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router:  router)
        
        view.presenter = presenter
        return factory(view)
    }
}
