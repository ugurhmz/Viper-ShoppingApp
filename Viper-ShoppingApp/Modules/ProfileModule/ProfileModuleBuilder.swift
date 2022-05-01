//
//  ProfileModuleBuilder.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import Foundation
import UIKit


class ProfileModuleBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        view.title = "Profile"
        
        return factory(view)
    }
    
}
