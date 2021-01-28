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

class LogInViewModel {
    let user: User = User()
    let disposeBag = DisposeBag()
    let emailViewModel = EmailViewModel()
    let passwordViewModel = PasswordViewModel()
    let isSuccess: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let errorMessage: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    func validateCredentials() -> Bool {
        return emailViewModel.validateCredentials() && passwordViewModel.validateCredentials()
    }
    func loginUser() {
        user.username = emailViewModel.data.value
        user.password = passwordViewModel.data.value
        self.isLoading.accept(true)
        
        Auth.auth().loginUser(email: user.username, password: user.password).subscribe(onNext: {response in
            self.isLoading.accept(false)
            self.isSuccess.accept(true)
        }, onError: {error in
            self.isLoading.accept(false)
            self.errorMessage.accept(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
