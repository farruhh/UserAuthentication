//
//  NetworksCommunicator.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/25.
//

import Foundation
import Firebase
import RxSwift
import RxCocoa

class NetworksCommunicator {
    func login(user: User) {
        let result = Auth.auth().loginUser(email: user.username, password: user.password)
        print(result)
    }
}

extension Firebase.Auth {
    func loginUser(email: String, password: String) -> Observable<Result<Int, Error>> {
        Observable.create { observer in
            self.signIn(withEmail: email, password: password) { (success, error) in
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
