//
//  AppSettings.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/25.
//

import Foundation
import CocoaLumberjack

class AppSettings {
    private static var user: User?
    
    static func sharedUser(_ user: User?) {
        if let existUser = user {
            ArchivedUser.archiveUser(existUser)
            self.user = existUser
        } else {
            DDLogDebug("No User")
            UserDefaults.standard.removeObject(forKey: "userData")
            UserDefaults.standard.synchronize()
        }
    }
    static func sharedUser() -> User? {
        if AppSettings.user == nil {
            AppSettings.user = ArchivedUser.loadUser()
        }
        return AppSettings.user
    }
}

fileprivate class ArchivedUser {
    static func archiveUser(_ user: User) {
        DDLogDebug("Archiving User.. . ")
        DDLogDebug("User: \(user)")
        let userData = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(userData, forKey: "userData")
        UserDefaults.standard.synchronize()
    }
    static func loadUser() -> User? {
        DDLogDebug("Loading User.. .")
        let userData = UserDefaults.standard.data(forKey: "userData")
        if userData == nil {
            return nil
        }
        let archivedUser = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData!) as? User
        guard let user = archivedUser, user.isValidUser() else {
            DDLogDebug("Failed Loading User: \(String(describing: archivedUser))")
            return nil
        }
        DDLogDebug("Loaded User: \(String(describing: archivedUser))")
        return archivedUser
    }
}
