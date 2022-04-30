//
//  TopHeaderUIView.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import Foundation


import UIKit

class TopHeaderUIView: UIView {

  
    
    private let topImgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "groceryheader")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupViews()
       }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
       
    private func setupViews(){
        [topImgView].forEach { addSubview($0) }
           
        topImgView.layer.borderWidth = 1
        topImgView.layer.borderColor = UIColor.black.cgColor
        topImgView.layer.cornerRadius = 20
       
        topImgView.backgroundColor   = .lightGray
        topImgView.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: .init(top: 10, left: 10, bottom: 5, right: 10)
        )
     }
}
