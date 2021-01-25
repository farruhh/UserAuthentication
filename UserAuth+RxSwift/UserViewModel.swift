//
//  UserViewModel.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/22.
//

import Foundation
import FirebaseAuth
import Firebase


/// `UserValidationState : .Valid or .InValid State for the User`
enum UserValidationState {
    case Valid
    case Invalid(String)
}
/// `UserViewModel: manages user data and logic `
class UserViewModel {
    private let minUserNameLength = 4
    private let minPasswordLength = 5
    private var user: User?
    
    var username: String {
        return user?.username ?? "no user"
    }
    var password: String {
        return user?.password ?? "no password"
    }
//    var protectedUserName: String {
//        let characters = username.count
//        if characters >= minUserNameLength {
//            var displayName = [Character]()
//            for (index, characters) in username.enumerated() {
//                if (index > characters.hashValue - minUserNameLength) {
//                    displayName.append(characters)
//                } else {
//                    displayName.append("*")
//                }
//            }
//            return String(displayName)
//        }
//        return username
//    }
}

extension UserViewModel {
    func updateUsername(username: String) {
        user?.username = username
    }
    func updatePassword(password: String) {
        user?.password = password
    }
    func validate() -> UserValidationState {
        if (user?.username.isEmpty)! || ((user?.password.isEmpty) != nil) {
            return .Invalid("Username and Password can't be blank!")
        }
        if (user?.username.count)! < minUserNameLength {
            return .Invalid("Username must be at least \(minUserNameLength) characters long!")
        }
        if (user?.password.count)! < minPasswordLength {
            return .Invalid("Password must be at least \(minPasswordLength) characters long!")
        }
        return .Valid
    }
    func login() {
        Auth.auth().signIn(withEmail: user!.username, password: user!.password, completion: { success, error in
            if let success = success {
                print(success.user.email!)
            }
            if let error = error {
                print(error.localizedDescription)
            }
            if error == nil {
               
                print("no error")
            }
        })
    }
}
