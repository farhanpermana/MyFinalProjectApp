//
//  SignUpController.swift
//  FinalProject
//
//  Created by Farhan Permana on 07/05/23.
//

import UIKit
import FirebaseAuth

class SignUpController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpBtnTapped(_ sender: Any) {

        guard let emailtextfield = emailTextField.text else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Email is not valid"])
            print(error)
            return
        }
        guard let passwordtextfield = passwordTextField.text else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Password is not valid"])
            print(error)
            return
        }
        Auth.auth().createUser(withEmail: emailtextfield, password: passwordtextfield) { (result, error) in
            if error != nil {
                print("Error sign up", error?.localizedDescription ?? "")
            } else {
                print("Sign up success")
                self.showSignInController()
            }
        }
    
        
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        showSignInController()
        removeFromParent()
    }
}

extension UIViewController {
    func showSignUpController() {
        let vc = SignUpController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
}
