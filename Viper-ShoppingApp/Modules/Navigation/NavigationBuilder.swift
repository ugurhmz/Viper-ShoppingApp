//
//  NavigationBuilder.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation
import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        
        let textStyleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white,
                                                                  .font: UIFont.init(name: "AvenirNext-DemiBold", size: 28.0)!
        ]
        
        let largeTextStyleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white,.font: UIFont.init(name: "AvenirNext-DemiBold", size: 34.0)!
        ]
        
        
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.barTintColor = UIColor(red: 197/255, green: 33/255, blue: 52/255, alpha: 1)
        //navigationController.navigationBar.tintColor = .red
        navigationController.navigationBar.titleTextAttributes = textStyleAttributes
        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.backgroundColor = .red
        
        if #available(iOS 13.0, *) {
                 let navBarAppearance = UINavigationBarAppearance()
                 //navBarAppearance.configureWithOpaqueBackground()
                  navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 30)!]
            
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white,.font: UIFont.init(name: "AvenirNext-DemiBold", size: 34.0)!
            ]
            
            
            navBarAppearance.backgroundColor = UIColor(red: 197/255, green: 33/255, blue: 52/255, alpha: 1)
            
                 navigationController.navigationBar.standardAppearance = navBarAppearance
                 navigationController.navigationBar.compactAppearance = navBarAppearance
                 navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance

           navigationController.navigationBar.prefersLargeTitles = false
            navigationController.navigationBar.titleTextAttributes = textStyleAttributes
            navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
            
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.prefersLargeTitles = true
        
                 }

        return navigationController
    }
    
}
