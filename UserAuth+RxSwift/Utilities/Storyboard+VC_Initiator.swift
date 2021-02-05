//
//  Storyboard+VC_Initiator.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/25.
//

import UIKit
///`VC initiator extension via UIStoryboard `
extension UIStoryboard {
    fileprivate class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    class func rootNavigationViewController() -> UINavigationController {
        return mainStoryboard().instantiateViewController(withIdentifier: "rootNavigation") as! UINavigationController
    }
    class func splashViewController() -> SplashViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
    }
    class func logInViewConroller() -> LoginViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    class func signUpViewController() -> SignUpViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
    }
    class func userProfileViewController() -> UserProfileViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
    }
    class func homePageViewController() -> CryptoHomePageViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "CryptoHomePageViewController") as! CryptoHomePageViewController
    }
    class func walletViewController() -> CryptoWalletViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "CryptoWalletViewController") as! CryptoWalletViewController
    }
    class func walletLiskViewController() -> CryptoWalletLiskViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "CryptoWalletLiskViewController") as! CryptoWalletLiskViewController
    }
    class func walletAddViewController() -> CryptoWalletAddMoneyViewController {
        return mainStoryboard().instantiateViewController(withIdentifier: "CryptoWalletAddMoneyViewController") as! CryptoWalletAddMoneyViewController
    }
}
