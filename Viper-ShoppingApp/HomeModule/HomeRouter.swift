//
//  HomeRouter.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation
import UIKit


protocol HomeRouterProtocol {
    
}


class HomeRouter: HomeRouterProtocol {
    var viewController: UIViewController
    
    init(view: UIViewController){
        self.viewController = view
    }
}
