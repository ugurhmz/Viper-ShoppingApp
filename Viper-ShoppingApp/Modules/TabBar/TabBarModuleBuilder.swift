//
//  TabBarModuleBuilder.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import  UIKit

class TabBarModuleBuilder {
    
    static func  build(usingSubmodules submodules: TabBarRouter.Submodules) -> UITabBarController {
        
        let tabs = TabBarRouter.tabs(usingSubmodules: submodules)
        let interactor = CartInteractor(database: RealmDataBase.shared)
        let presenter = TabBarPresenter(useCase: (
            getCartCount: interactor.getCartCount, ()
        ))
        
        
        let tabBarController = GroceryTabBarController(tabs: tabs, presenter: presenter)
        presenter.view = tabBarController
        tabBarController.tabBar.tintColor = .systemBlue
        return tabBarController
    }
}


