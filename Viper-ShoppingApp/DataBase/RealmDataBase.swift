//
//  RealmDataBase.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation
import RealmSwift


class RealmDataBase: CartDbProtocol {
    
    
    static let shared: RealmDataBase = RealmDataBase()
    var notificationToken: NotificationToken?
    private init() {}
    
    
    deinit {
        notificationToken?.invalidate()
    }

    
   
    func gertCartItem(usingPrdId prdId: Int) -> CartItemModel {
        let realm = try! Realm()
        
        guard let realmbObject =  realm.objects(RealmCartItem.self).first(where: { $0.prdId == prdId }) else {
            return CartItemModel(prdId: prdId, value: 0)
        }
        
        return CartItemModel(realmCartItem: realmbObject)
    }
    
    
    
    func valArtir(){
        
    }
    
    //MARK: - UPDATE CART
    func updateCart(using cartItem: CartItemModel) -> (Bool) {
        
        let realm = try! Realm()
        
        do {
           
            try realm.write {
                realm.add(RealmCartItem(cartItem: cartItem), update: .all)
            }
        } catch {
            print("db updating err")
            return false
        }
        
        return true
    }
    
    
    //MARK: - Delete
    func delete(fromCart prdId: Int) -> (Bool) {
        let realm = try! Realm()
        
        do {
           
            try realm.write {
                
                if let realmObject = realm.objects(RealmCartItem.self).first(where: {
                    $0.prdId == prdId }) {
                    realm.delete(realmObject)
                }
              
            }
        } catch {
            print("db updating err")
            return false
        }
        
        return true
    }
    
    
    

    //MARK: -  GET CART COUNT
    func getCount(closure: @escaping  (Int) -> (Void)) -> Void {
        
        let realm = try! Realm()
        let results = realm.objects(RealmCartItem.self)
        notificationToken = results.observe({ _ in
            closure(results.count)
        })
    }
    
    
}
