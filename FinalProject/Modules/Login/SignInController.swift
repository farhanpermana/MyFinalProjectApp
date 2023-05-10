//
//  SignInController.swift
//  FinalProject
//
//  Created by Farhan Permana on 08/05/23.
//

import UIKit
import FirebaseAuth

class SignInController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var forgot: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        signInBtn.tintColor = UIColor(rgb: 0x75001d)
        titleLabel.textColor = UIColor(rgb: 0x75001d)
        signUpBtn.tintColor = UIColor(rgb: 0x75001d)
        forgot.tintColor = UIColor(rgb: 0x75001d)
        
    }


    @IBAction func signInBtnTapped(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("Error login", error?.localizedDescription ?? "")
            } else {
                print("Login success")

                self.showHomeController()
            }
        }
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        showSignUpController()
        removeFromParent()
    }

}

extension UIViewController {
    func showSignInController() {
        let vc = SignInController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
}
