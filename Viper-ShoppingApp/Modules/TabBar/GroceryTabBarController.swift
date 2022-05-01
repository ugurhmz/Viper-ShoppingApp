//
//  GroceryTabBarController.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import UIKit


typealias GroceryTabs = (
    home: UIViewController,
    cart: UIViewController,
    profile: UIViewController
)


class GroceryTabBarController: UITabBarController {

    
    init(tabs: GroceryTabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.home, tabs.cart, tabs.profile]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
}
