//
//  SignUpViewController.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/18.
//

import UIKit
import FirebaseAuth
import Firebase
import CocoaLumberjack

class SignUpViewController: UIViewController, Storyboarded {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    weak var coordinator: MainCoordinator?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onSignUpButtonClicked(_ sender: Any) {
        signUp()
    }
    func signUp() {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(success, error) in
            guard let user = success?.user, error == nil else {
                DDLogError(error!)
                return
            }
            print(user.email!)
        })
    }
    @IBAction func onAppleSignUpClicked(_ sender: Any) {
        
    }
    @IBAction func onFacebookSignUpClicked(_ sender: Any) {
    }
    @IBAction func onGoogleSignUpClicked(_ sender: Any) {
    }
    @IBAction func onTwitterSignUpClicked(_ sender: Any) {
    }
}
