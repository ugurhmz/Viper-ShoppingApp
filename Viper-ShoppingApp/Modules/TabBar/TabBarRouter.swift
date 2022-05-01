//
//  TabBarRouter.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import Foundation
import UIKit


class TabBarRouter {
    var viewController: UIViewController
    
    typealias Submodules = (
        home: UIViewController,
        cart: UIViewController,
        profile: UIViewController
    )
    
    init(viewController: UIViewController){
        self.viewController = viewController
    }
    
}

extension TabBarRouter {
    
    
    static func tabs(usingSubmodules submodules: Submodules) -> GroceryTabs {
            
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        let cartTabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        
        submodules.home.tabBarItem = homeTabBarItem
        submodules.cart.tabBarItem = cartTabBarItem
        submodules.profile.tabBarItem = profileTabBarItem
        
        return (
            home: submodules.home,
            cart: submodules.cart,
            profile: submodules.profile
        )
        
    }
}
