//
//  HomePresenter.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad() -> Void
   // func onAddToCart(prdItem: PrdItem) -> Void
}


class HomePresenter: HomePresenterProtocol {
    
    
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
        
    }
    
    func viewDidLoad() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getGroceries(completion: { (result) in
                print(result)
                let groceryList = result.groceries.compactMap({
                    GroceryItemGenerator(using: $0)
                })
                
                // update to view
                DispatchQueue.main.async {
                    print(groceryList)
                    self?.view?.updateGroceries(groceriesList: groceryList)
                }
                
            })
        }
    }
    
    
}



//MARK: -
struct GroceryItemGenerator {
    public var title : String
    public var prdImage : String
    public var descriptions : String
    public var price : Double
    
    init(using groceryModel: GroceryInfo){
        self.title = groceryModel.title ?? "-"
        self.descriptions = groceryModel.descriptions ?? "-"
        self.prdImage = groceryModel.prdImage ?? "-"
        self.price = groceryModel.price ?? 0
    }
}
