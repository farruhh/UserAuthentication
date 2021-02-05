//
//  PasswordViewModel.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/28.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase

class PasswordViewModel: ValidationViewModel {
    var errorMessage: String = ""
    var data: BehaviorRelay<String> = BehaviorRelay(value: "")
    var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
    
    func validateCredentials() -> Bool {
        guard validatePasswordLength(text: data.value, size: (8,15)) else {
            errorValue.accept(errorMessage)
            return false
        }
        errorValue.accept("")
        return true
    }
    func validatePasswordLength(text: String, size: (min: Int, max: Int)) -> Bool {
        return (size.min...size.max).contains(text.count)
    }
    func resetPassword() {
        let alert = UIAlertController.init(title: "Forgot Your Password?", message: "Enter the Email", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textfield in
            textfield.placeholder = "Email"
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "reset password", style: .default, handler: { (action) in
            guard let resetEmail = alert.textFields?.first?.text else {
                return
            }
            Auth.auth().sendPasswordReset(withEmail: resetEmail, completion: { (error) in
                if (error != nil) {
                    let errorAlert = UIAlertController(title: "Password Reset Failed.", message: "Check and Try Again.", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    errorAlert.present(errorAlert, animated: true, completion: nil)
                } else {
                    let successAlert = UIAlertController(title: "Password reset is Succssful.", message: "Link on how to reset your password is sent to your email.", preferredStyle: .alert)
                    successAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    successAlert.present(successAlert, animated: true, completion: nil)
                }
                
            })
        }))
        alert.present(alert, animated: true, completion: nil)
    }
}
