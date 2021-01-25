//
//  LoginViewController.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/18.
//

import UIKit
import CocoaLumberjack

class LoginViewController: UIViewController, Storyboarded {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    weak var coordinator: MainCoordinator?
    var userViewModel: UserViewModel = UserViewModel()
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    @IBAction func onSignInClicked(_ sender: Any) {
        switch userViewModel.validate() {
        case .Valid:
            userViewModel.login()
            coordinator?.gotoUserProfile()
        case .Invalid(let error):
            print(error)
        }
    }
    
    @IBAction func onAppleSignInClicked(_ sender: Any) {
        coordinator?.gotoSignUP()
    }
    @IBAction func onFacebookSignInClicked(_ sender: Any) {
    }
    @IBAction func onGoogleSignInClicked(_ sender: Any) {
    }
    @IBAction func onTwitterSignInClicked(_ sender: Any) {
    }
}
//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            textField.text = userViewModel.username
        } else {
            textField.text = userViewModel.password
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            textField.text = userViewModel.username
        } else {
            textField.text = userViewModel.password
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            emailTextField.becomeFirstResponder()
        } else {
            print("else?")
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == emailTextField {
            userViewModel.updateUsername(username: newString)
        } else {
            userViewModel.updatePassword(password: newString)
        }
        return true
    }
    
}
