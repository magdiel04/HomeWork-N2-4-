//
//  ViewController.swift
//  HomeWork N2(4)
//
//  Created by Magdiel Altynbekov on 29/12/22.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    private var controller: AuthConroller?
    
    var  userNameTextField = UITextField()
    
    var passwordTextField = UITextField()
    
    private var authButton: UIButton = {
        let authButton = UIButton(type: .system)
        authButton.layer.cornerRadius = 20
        authButton.backgroundColor = .black
        authButton.setTitle("sign in", for: .normal)
        authButton.setTitleColor(.white, for: .normal)
      
        authButton.addTarget(self, action: #selector(authButtonTap), for: .touchUpInside)
        return authButton
    }()
    
    @objc func authButtonTap() {
        let usernameInput = userNameTextField.text!
        let passwordInput = passwordTextField.text!
        let result = controller!.getUserInfo(username: usernameInput, password: passwordInput)
        
        if result == true {
            let profileVC = ProfileView()
            profileVC.getUsernameLabelText().text = usernameInput
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            let errorAlert = UIAlertController(title: "Не правильные данные", message: "Попробуйте еще раз", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            errorAlert.addAction(okAction)
            present(errorAlert, animated: true)
        }
}

    override func viewDidLoad() {
        super.viewDidLoad()
     controller = AuthConroller(view: self)
        setupSubviews()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 5
        passwordTextField.isSecureTextEntry = true
       
        // Do any additional setup after loading the view.
    }

    func setupSubviews() {
       
        userNameTextField.layer.cornerRadius = 8
        userNameTextField.layer.borderWidth = 2
        userNameTextField.layer.borderColor = UIColor.orange.cgColor
        userNameTextField.placeholder = " Имя Пользователя"
        
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.orange.cgColor
        passwordTextField.placeholder = " Пароль"
        
        view.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(200)
            make.width.equalTo(view.frame.width - 40)
            make.height.equalTo(40)
            userNameTextField.backgroundColor = .white
        }
        view.addSubview(passwordTextField)
        
       
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(250)
            make.width.equalTo(view.frame.width - 40)
            make.height.equalTo(40)
        }
        
        view.addSubview(authButton)
       
        authButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(100)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }


}


