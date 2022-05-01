//
//  HomePresenter.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad() -> Void
    func onAddToCart(prdItem: PrdItem) -> Void
}


class HomePresenter: HomePresenterProtocol {
    
    
    weak var view: HomeViewProtocol?
    typealias UseCase = (
        getGroceries:  (_ completion: (GroceryResult) -> (Void)) -> Void,
        addToCart: (PrdItem) -> Bool,
        getCartItem: (Int) -> CartItemModel
    )
    var router: HomeRouterProtocol
    
    var useCase: UseCase?
    
    init(view: HomeViewProtocol, useCase: HomePresenter.UseCase, router: HomeRouterProtocol){
        self.view = view
        self.useCase = useCase
        self.router = router
        
    }
    
    //
    func viewDidLoad() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.useCase?.getGroceries({ (result) in
                let groceryList = result.groceries.compactMap({ grocery -> GroceryItemGenerator in
                    let cartItem = self?.useCase?.getCartItem(grocery.id ?? 0)
                    return GroceryItemGenerator(using: grocery, cartItem: cartItem!)
                })
                
                // update to view
                DispatchQueue.main.async {
                    print(groceryList)
                    self?.view?.updateGroceries(groceriesList: groceryList)
                }
                
            })
        }
    }
    
    
    // onAddToCart
    func onAddToCart(prdItem: PrdItem) -> Void {
        
        DispatchQueue.global(qos: .background).async {
            let updated = self.useCase?.addToCart(prdItem)
            print("Add to cart updated with result = \(updated)")
            
            DispatchQueue.main.async {
                // let's implement a spinner for this one
            }
        }
    }
    
    
    
}



//MARK: -
struct GroceryItemGenerator {
    public var id: Int
    public var title : String
    public var prdImage : String
    public var descriptions : String
    public var price : Double
    public var cartValue: CartValueViewModel
    
    init(using groceryModel: GroceryInfo, cartItem: CartItemModel){
        self.id = groceryModel.id ?? 0
        self.title = groceryModel.title ?? "-"
        self.descriptions = groceryModel.descriptions ?? "-"
        self.prdImage = groceryModel.prdImage ?? "-"
        self.price = groceryModel.price ?? 0
        self.cartValue = CartValueViewModel(prdId: cartItem.prdId, stepValue: cartItem.value)
    }
}
