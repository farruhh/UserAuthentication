//
//  MainCoordinator.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/22.
//

import Foundation
import  UIKit

/// `Helper Class for  Custom UINavigationControl Flow.. . Alternative method where < " prepare for segue " > method is inconvinient`
/// `Make sure all the VCs inherit the delegate methods provided by the < MainCoordinator > in order to be instantiated & utilized.. .`
class MainCoordinator: Coordinator {
    
    var subCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// `Initial VC initialization`
    func start() {
        
        UIApplication.appDelegate().window?.rootViewController = self.navigationController
        let vc = CustomTabBarController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func gotoSignUP() {
        let vc = SignUpViewController.instantiate()
        vc.navigationController?.isNavigationBarHidden = false
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func gotoLogIn() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func gotoUserProfile() {
        let vc = UserProfileViewController.instantiate()
        vc.coordinator = self
        UIApplication.userProfileViewController()
    }
}
