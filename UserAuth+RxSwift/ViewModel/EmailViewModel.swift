//
//  EmailViewModel.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/28.
//

import Foundation
import RxSwift
import RxCocoa

class EmailViewModel: ValidationViewModel {
    var errorMessage: String = "Enter valid email"
    var data: BehaviorRelay<String> = BehaviorRelay(value: "")
    var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
    
    func validateCredentials() -> Bool {
        guard validateEmail(pattern: data.value) else {
            errorValue.accept(errorMessage)
            return false
        }
        errorValue.accept("")
        return true
    }
    func validateEmail(pattern: String) -> Bool {
        let emailStringPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPatternPredicate = NSPredicate(format: "SELF MATCHES %@", emailStringPattern)
        return emailPatternPredicate.evaluate(with: pattern)
    }
}
