//
//  BeerDescritionVC.swift
//  HomeWork N2(4)
//
//  Created by Magdiel Altynbekov on 29/12/22.
//

import SnapKit
import UIKit


class BeerDescriptionVC: UIViewController {
    
    
    var beerNameLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    var descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    
    
    func setupSubviews() {
        view.addSubview(beerNameLabel)
        
        view.addSubview(descriptionNameLabel)
        
        beerNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        descriptionNameLabel.snp.makeConstraints { make in
            make.top.equalTo(beerNameLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(10)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    
}
