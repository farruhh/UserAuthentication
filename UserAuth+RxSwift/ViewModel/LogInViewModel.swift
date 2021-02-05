//
//  LogInViewModel.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/28.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase

enum LoginError: Error {
    case inCompleteForm
    case inValidEmail
    case inValidPassword
}
class LogInViewModel {
    let user: User = User()
    let disposeBag = DisposeBag()
    let emailViewModel = EmailViewModel()
    let passwordViewModel = PasswordViewModel()
    let isSuccess: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let errorMessage: BehaviorRelay<String> = BehaviorRelay(value: "")
    
//    func validateCredentials() -> Bool {
//        return emailViewModel.validateCredentials() && passwordViewModel.validateCredentials()
//    }
    func loginUser() throws {
        user.username = emailViewModel.data.value
        user.password = passwordViewModel.data.value
        self.isLoading.accept(true)
        
        if !user.isValidUser() {
            throw LoginError.inCompleteForm
        }
        if !emailViewModel.validateCredentials() {
            throw LoginError.inValidEmail
        }
        if !passwordViewModel.validateCredentials() {
           throw  LoginError.inValidPassword
        }
        Auth.auth().loginUser(email: user.username, password: user.password).subscribe(onNext: {response in
            self.isLoading.accept(false)
            self.isSuccess.accept(true)
        }, onError: {error in
            self.isLoading.accept(false)
            self.errorMessage.accept(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
