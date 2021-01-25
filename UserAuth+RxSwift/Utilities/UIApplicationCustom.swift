//
//  UIApplicationCustom.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/25.
//

import UIKit

extension UIApplication {
    static func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    static func rootNavigationViewController() {
        let rootNavigationVC = UIStoryboard.rootNavigationViewController()
        update(rootNavigationVC)
    }
    static func rootLoginViewController() {
        let rootLoginViewController = UIStoryboard.logInViewConroller()
        update(rootLoginViewController)
    }
    static func userProfileViewController() {
        let userProfileViewController = UIStoryboard.userProfileViewController()
        update(userProfileViewController)
    }
    fileprivate static func update(_ vc: UIViewController) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        window.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: { completed in
            print(completed)
        })
    }
}
