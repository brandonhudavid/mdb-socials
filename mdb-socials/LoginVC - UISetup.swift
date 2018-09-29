//
//  LoginVC - UISetup.swift
//  mdb-socials
//
//  Created by Brandon David on 9/27/18.
//  Copyright © 2018 Brandon David. All rights reserved.
//

import Foundation
import UIKit

extension LoginVC {
    
//    func setupLogo() {
//        logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        logoImageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 3)
//        logoImageView.image = UIImage(named: "Snapchat_Logo")
//        view.addSubview(logoImageView)
//    }
    
    func setupSegControl() {
        loginRegisterSegControl = UISegmentedControl(items: ["Login", "Sign Up"])
        loginRegisterSegControl.frame = CGRect(x: view.frame.width / 4, y: 50, width: view.frame.width / 2 , height: 30)
        loginRegisterSegControl.tintColor = UIColor(r: 0, g: 188, b: 255)
        loginRegisterSegControl.selectedSegmentIndex = 1
        loginRegisterSegControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        view.addSubview(loginRegisterSegControl)
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton = UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width - 40, height: 60))
        loginRegisterButton.backgroundColor = UIColor(r: 255, g: 96, b: 136)
        loginRegisterButton.setTitle("Register", for: UIControlState())
        loginRegisterButton.setTitleColor(UIColor.white, for: UIControlState())
        loginRegisterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginRegisterButton.addTarget(self, action: #selector(handleLoginOrRegister), for: .touchUpInside)
        view.addSubview(loginRegisterButton)
    }
    
    func setupTextFields() {
        nameTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2, width: view.frame.width - 20, height: 40))
        nameTextField.layer.cornerRadius = 20
        nameTextField.placeholder = "  Name"
        nameTextField.backgroundColor = .white
        view.addSubview(nameTextField)
        
        phoneNumberTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2 + 50, width: view.frame.width - 20, height: 40))
        phoneNumberTextField.layer.cornerRadius = 20
        phoneNumberTextField.placeholder = "  Phone Number"
        phoneNumberTextField.backgroundColor = .white
        view.addSubview(phoneNumberTextField)
        
        emailTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2 + 100, width: view.frame.width - 20, height: 40))
        emailTextField.placeholder = "  Email Address"
        emailTextField.layer.cornerRadius = 20
        emailTextField.backgroundColor = .white
        view.addSubview(emailTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: 10, y: view.frame.height / 2 + 150, width: view.frame.width - 20, height: 40))
        passwordTextField.placeholder = "  Password"
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        view.addSubview(passwordTextField)
        
    }
}
