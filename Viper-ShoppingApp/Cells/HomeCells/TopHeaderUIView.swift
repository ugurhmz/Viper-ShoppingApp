//
//  TopHeaderUIView.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


import UIKit

class TopHeaderUIView: UIView {

    private let topTextLbl: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 36)
        label.text = "Fresh Groceries"
        label.textColor = UIColor(red: 255/255, green: 58/255, blue: 80/255, alpha: 1)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupViews()
       }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
       
    private func setupViews(){
        [topTextLbl].forEach { addSubview($0) }
           
        topTextLbl.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: .init(top: 0, left: 30, bottom: 10, right: 0)
        )
     }
}
