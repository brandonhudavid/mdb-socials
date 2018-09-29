//
//  ViewController.swift
//  mdb-socials
//
//  Created by Brandon David on 9/27/18.
//  Copyright © 2018 Brandon David. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class LoginVC: UIViewController {
    
    var logoImageView: UIImageView!
    var loginRegisterSegControl: UISegmentedControl!
    
    var nameTextField: UITextField!
    var phoneNumberTextField: UITextField!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    
    var loginRegisterButton: UIButton!
    
    var ourUserID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 254, b: 0)
//        setupLogo()
        setupSegControl()
        setupLoginRegisterButton()
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        loginRegisterButton.isUserInteractionEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    @objc func handleLoginOrRegister() {
//        loginRegisterButton.isUserInteractionEnabled = false
        if loginRegisterSegControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
        var email = ""
        var password = ""
        email = emailTextField.text!
        if email == "" {
            self.displayAlert(title: "Missing email", message: "Please include a valid email.")
            return
        }
        password = passwordTextField.text!
        if password == "" {
            self.displayAlert(title: "Missing password", message: "Please include your password.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                self.loginRegisterButton.isUserInteractionEnabled = true
                print(error)
                self.displayAlert(title: "Authentication Error", message: "There was an error in trying to sign you in.")
                return
            } else {
                self.ourUserID = user?.user.uid
                self.performSegue(withIdentifier: "toMainFeed", sender: self)
            }
        })
        
        
    }
    
    func handleRegister() {
        var name = "name"
        var number = "number"
        var email = "email@email.com"
        var password = "password"
        name = nameTextField.text!
        if name == "" {
            self.displayAlert(title: "Missing email", message: "Please include a valid email.")
            return
        }
        number = phoneNumberTextField.text!
        if number == "" {
            self.displayAlert(title: "Missing phone number", message: "Please include your phone number.")
            return
        }
        email = emailTextField.text!
        if email == "" {
            self.displayAlert(title: "Missing email", message: "Please include a valid email.")
            return
        }
        password = passwordTextField.text!
        if password == "" {
            self.displayAlert(title: "Missing password", message: "Please include your password.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                self.loginRegisterButton.isUserInteractionEnabled = true
                print(error)
                self.displayAlert(title: "There was an error", message: "Trying to make you")
                return
            } else {
                guard let uid = user?.user.uid else {
                    return
                }
                let ref = Database.database().reference()
                let userRef = ref.child("users").child(uid)
                let values = ["name": name, "number": number, "email": email]
                
                userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                    if error != nil {
                        print(error)
                        return
                    } else {
                        self.ourUserID = user?.user.uid
                        self.performSegue(withIdentifier: "toMainFeed", sender: self)
                    }
                })
            }
        })
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleLoginRegisterChange() {
        let index = loginRegisterSegControl.selectedSegmentIndex
        let title = loginRegisterSegControl.titleForSegment(at: index)
        loginRegisterButton.setTitle(title, for: UIControlState())
        
        if title == "Login" {
            nameTextField.isHidden = true
            phoneNumberTextField.isHidden = true
        } else {
            nameTextField.isHidden = false
            phoneNumberTextField.isHidden = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let feedVC = segue.destination as? FeedVC {
//            feedVC.userID = ourUserID
//        }
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

