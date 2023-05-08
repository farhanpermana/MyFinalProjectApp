//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Farhan Permana on 05/05/23.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginBtnTapped(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("Error login", error?.localizedDescription ?? "")
            } else {
                print("Login success")
//                self.performSegue(withIdentifier: "loginToHome", sender: nil)
                self.showHomeController()
            }
        }
    
    }
    
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        
    }
}

