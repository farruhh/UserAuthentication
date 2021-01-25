//
//  User.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/22.
//

import Foundation
import UIKit

/// `User data`
class User {
    var username: String = ""
    var password: String = ""
    
    init(_ username: String, password: String ) {
        self.username = username
        self.password = password
    }
    
    func isValidUser() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
}
