//
//  TabBarPresenter.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 1.05.2022.
//

import Foundation


protocol TabBarPreserProtocol {
    func viewDidLoad()
}


class TabBarPresenter: TabBarPreserProtocol {
    
    weak var view: TabBarViewProtocol?
    typealias UseCase = (
        getCartCount: (@escaping (Int) -> Void ) -> Void, ()
        
    )
    
    var useCase: UseCase
    
    init(useCase: TabBarPresenter.UseCase){
        self.useCase  = useCase
    }
    
    
    func viewDidLoad() {
        
            self.useCase.getCartCount { count in
                    self.view?.updateCartCount(count: count)
            }
        
        
    }
    
    
}
