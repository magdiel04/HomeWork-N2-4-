//
//  AuthModel.swift
//  HomeWork N2(4)
//
//  Created by Magdiel Altynbekov on 29/12/22.
//

import Foundation

class AuthModel {
    var users: [User] = []
    
    func loadUsers() {
         users.append(User(username: "Chetam", password: "123"))
        users.append(User(username: "Ohmygod", password: "1234"))
        users.append(User(username: "Maga", password: "maga04"))
    }
    
    private weak var controller: AuthConroller!
    
    init(controller: AuthConroller!) {
        self.controller = controller
    }
    
    func checkUserInfo(username: String, password: String) -> Bool {
        
        loadUsers()
        
        var isFounded: Bool = false
        
        let currentUser = User(username: username, password: password)
        
        for user in users {
            if currentUser.username == user.username && currentUser.password == user.password{
                isFounded = true
                break
            }else{
                isFounded = false
            }
        }
        
        return isFounded
        
    }
    
}
