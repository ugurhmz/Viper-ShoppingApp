//
//  GroceryTabBarController.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import UIKit


protocol TabBarViewProtocol: AnyObject {
    func updateCartCount(count: Int)
}


typealias GroceryTabs = (
    home: UIViewController,
    cart: UIViewController,
    profile: UIViewController
)


class GroceryTabBarController: UITabBarController {

    
    var cartTab: UIViewController
    var presenter: TabBarPreserProtocol?
    
    
    init(tabs: GroceryTabs, presenter: TabBarPreserProtocol) {
        self.presenter = presenter
        self.cartTab = tabs.cart
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.home, tabs.cart, tabs.profile]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter?.viewDidLoad()
    }
   
}


//MARK: -
extension GroceryTabBarController: TabBarViewProtocol {
    
    func updateCartCount(count: Int) {
        self.cartTab.tabBarItem.badgeValue =  count > 0 ? "\(count)" : nil
    }
    
}
