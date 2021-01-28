//
//  PasswordViewModel.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/28.
//

import Foundation
import RxSwift
import RxCocoa

class PasswordViewModel: ValidationViewModel {
    var errorMessage: String = "Invalid Password"
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
}
