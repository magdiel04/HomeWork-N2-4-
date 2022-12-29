//
//  ProfileView.swift
//  HomeWork N2(4)
//
//  Created by Magdiel Altynbekov on 29/12/22.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIViewController{
    
    var beers: [Beer] = []
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    
    
    
    var networkManager = NetworkManager()
    
    
    
    
    func getUsernameLabelText() -> UILabel {
        return userNameLabel
    }
    
    
    
    var beerTableView = UITableView()
    
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        beerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "beer_cell")

        beerTableView.dataSource = self
        beerTableView.delegate = self
        networkManager.getBeerList { beerList in
            self.beers = beerList
            self.beerTableView.reloadData()
        }
        setuoSubviews()
    }
    func setuoSubviews() {
        view.addSubview(beerTableView)
        
        beerTableView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        view.addSubview(userNameLabel)
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.bottom.equalTo(beerTableView.snp.top).offset(-50)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
    

    
}

extension ProfileView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beer_cell", for: indexPath)
        cell.textLabel?.text = beers[indexPath.row].name
        cell.detailTextLabel?.text = beers[indexPath.row].description
        return cell
    }


}



extension ProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beerDetailVC = BeerDescriptionVC()
        
        beerDetailVC.beerNameLabel.text = beers[indexPath.row].name
        beerDetailVC.descriptionNameLabel.text = beers[indexPath.row].description
        
        navigationController?.pushViewController(beerDetailVC, animated: true)
    }
}
