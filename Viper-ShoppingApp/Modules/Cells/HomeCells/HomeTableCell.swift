//
//  HomeTableCell.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation



import Foundation
import UIKit

typealias BagClosure = ((prdId: Int, stepValue: Int)) -> ()

class HomeTableCell: UITableViewCell {
    static var identifier = "HomeTableCell"
    var closure: BagClosure?
    
    var viewModel: CartValueViewModel! {
        didSet {
            let isHidden =  viewModel.showStepper
            
            addBagBtn.isHidden = isHidden
            plusBtn.isHidden = !isHidden
            minusBtn.isHidden = !isHidden
            stepperCountLbl.isHidden = !isHidden
            stepperCountLbl.text = "\(viewModel.stepValue)"
        }
    }
    
    var myPresenter: HomePresenterProtocol?
    
    var prdImageStr: String = ""
    
    private let imgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
      
        return iv
    }()
    
    private let prdTitleLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Apple"
        label.textColor = .systemBlue
        
        return label
    }()
    
    private let prdDescriptionLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.text = "lorem ipsum dolar sit at amet"
        label.numberOfLines = 0
        label.textColor = .black
        
        return label
    }()
    
    private let prdPriceLbl: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "$ 4.99"
        label.numberOfLines = 0
        label.textColor = .black
        
        return label
    }()
    
    private let addBagBtn: UIButton = {
        let buton = UIButton()
        buton.setTitle("ADD TO BAG", for: .normal)
        buton.backgroundColor = UIColor(red: 197/255, green: 33/255, blue: 52/255, alpha: 1)
        buton.layer.cornerRadius = 15
        buton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        buton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        buton.addTarget(self, action: #selector(addToClick), for: .touchUpInside)
        return buton
    }()
    
    
    private let plusBtn: UIButton = {
        let buton = UIButton()
        buton.setTitle("+", for: .normal)
        buton.backgroundColor = UIColor(red: 197/255, green: 33/255, blue: 52/255, alpha: 1)
        buton.setTitleColor(.white, for: .normal)
        buton.layer.cornerRadius = 15
        buton.contentEdgeInsets = UIEdgeInsets(top: 2, left: 7, bottom: 0, right: 2)
        buton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        buton.addTarget(self, action: #selector(incrementBtn), for: .touchUpInside)
        return buton
    }()
    
    private let minusBtn: UIButton = {
        let buton = UIButton()
        buton.setTitle("-", for: .normal)
        buton.backgroundColor = UIColor(red: 197/255, green: 33/255, blue: 52/255, alpha: 1)
        buton.setTitleColor(.white, for: .normal)
        buton.layer.cornerRadius = 15
        buton.contentEdgeInsets = UIEdgeInsets(top: 2, left: 7, bottom: 0, right: 2)
        buton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        buton.addTarget(self, action: #selector(decrementBtn), for: .touchUpInside)
        return buton
    }()
    
    private let stepperCountLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    @objc func addToClick(){
        self.viewModel = viewModel.onAddtoBag()
        closure?((viewModel.prdId, viewModel.stepValue))
    }
    
    @objc func incrementBtn(){
        self.viewModel = viewModel.onIncrement()
        closure?((viewModel.prdId, viewModel.stepValue))
        
    }
    
    @objc func decrementBtn(){
        self.viewModel = viewModel.onDecrement()
        closure?((viewModel.prdId, viewModel.stepValue))
       
    }
    
    
    
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let btnStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    
    
    
    //add to bag closure
    func addToBagClosure(usingViewModel viewModel: CartValueViewModel,
                         bagClosure: @escaping BagClosure) -> Void {
        
        self.viewModel = viewModel
        self.addBagBtn.setTitle(viewModel.title, for: .normal)
        self.closure = bagClosure
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [imgView, stackView, btnStackView].forEach{contentView.addSubview($0)}
        [prdTitleLbl, prdDescriptionLbl, prdPriceLbl].forEach{ stackView.addArrangedSubview($0)}
        
        
        [minusBtn, stepperCountLbl, plusBtn ,addBagBtn].forEach{ btnStackView.addArrangedSubview($0)}
        
        
        setConstraints()
        stackView.setCustomSpacing(-15, after: prdTitleLbl)
        stackView.setCustomSpacing(10, after: prdPriceLbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
}




//MARK: -  Fill data
extension HomeTableCell {
    func configure(groceryItem: GroceryItemGenerator ,
                   addToBagClosure: @escaping BagClosure ){
        self.prdTitleLbl.text = groceryItem.title
        self.imgView.image = UIImage(named: "\(groceryItem.prdImage)")
        self.prdImageStr = groceryItem.prdImage
        self.prdDescriptionLbl.text = groceryItem.descriptions
        self.prdPriceLbl.text = "$ \(groceryItem.price)"
        self.addToBagClosure(usingViewModel: groceryItem.cartValue,
                                                          bagClosure: addToBagClosure)
        
    }
}



//MARK: -
extension HomeTableCell {
    
    private func setConstraints() {
        imgView.anchor(top: contentView.topAnchor,
                       leading: contentView.leadingAnchor,
                       bottom:contentView.bottomAnchor,
                       trailing: nil,
                       padding: .init(top: 0, left: 15, bottom: 0, right: 30),
                       size: .init(width: 90, height: 0))
              
              
        stackView.anchor(top: contentView.topAnchor,
                           leading: imgView.trailingAnchor,
                           bottom: contentView.bottomAnchor,
                           trailing: contentView.trailingAnchor,
                           padding: .init(top: 0, left: 35, bottom: 0, right: 0))

        addBagBtn.anchor(top: nil,
                         leading: prdPriceLbl.trailingAnchor,
                         bottom:stackView.bottomAnchor,
                         trailing: stackView.trailingAnchor,
                         padding: .init(top: 0, left: 15, bottom: 10, right: 10),
                         size: .init(width: 170, height: 50))
        
        btnStackView.anchor(top: nil,
                         leading: prdPriceLbl.trailingAnchor,
                         bottom:stackView.bottomAnchor,
                         trailing: stackView.trailingAnchor,
                         padding: .init(top: 0, left: 15, bottom: 5, right: 10),
                         size: .init(width: 140, height: 50))
    }
}



//MARK: -
struct CartValueViewModel {
    let prdId: Int
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(prdId: Int, stepValue: Int){
        self.prdId = prdId
        self.title = "ADD TO BAG"
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
       
    }
}


//MARK: -
extension CartValueViewModel {
    
    func onAddtoBag() -> CartValueViewModel {
        return CartValueViewModel(prdId: self.prdId , stepValue: 1)
    }
    
    func onIncrement() -> CartValueViewModel {
        guard self.stepValue < 10 else { return self}
        return CartValueViewModel(prdId: self.prdId,  stepValue: self.stepValue + 1)
    }
    
    func onDecrement() -> CartValueViewModel {
        return CartValueViewModel(prdId: self.prdId, stepValue: self.stepValue - 1)
    }
    
}
