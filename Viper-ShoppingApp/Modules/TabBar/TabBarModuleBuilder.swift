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
        let tabBarController = GroceryTabBarController(tabs: tabs)
        return tabBarController
    }
}


