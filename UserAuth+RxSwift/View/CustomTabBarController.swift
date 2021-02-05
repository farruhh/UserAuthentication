//
//  CustomTabBarController.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/02/01.
//

import UIKit

enum TabBarItemIcons {
    static let homePage = UIImage(imageLiteralResourceName: "ico_1")
    static let wallet = UIImage(imageLiteralResourceName: "ico_2")
    static let walletLisk = UIImage(imageLiteralResourceName: "ico_3")
    static let walletAddMoney = UIImage(imageLiteralResourceName: "ico_4")
    static let profile = UIImage(imageLiteralResourceName: "ico_5")
}
enum TabBarItems {
    case homePage
    case wallet
    case walletLisk
    case walletAddMoney
    case profile
}
class CustomTabBarController: UITabBarController, UITabBarControllerDelegate, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let homePageVC = UIStoryboard.homePageViewController()
        let walletVC = UIStoryboard.walletViewController()
        let walletLiskVC = UIStoryboard.walletLiskViewController()
        let walletAddMoneyVC = UIStoryboard.walletAddViewController()
        let profileVC = UIStoryboard.userProfileViewController()
        
        homePageVC.tabBarItem = UITabBarItem(title: "", image: UIImage(imageLiteralResourceName: "ico_1"), selectedImage: UIImage(imageLiteralResourceName: "ico_1"))
        
        if let views = [homePageVC, walletVC, walletLiskVC, walletAddMoneyVC, profileVC] as [UIViewController]? {
            self.navigationController?.isNavigationBarHidden = false
            self.setViewControllers(views, animated: true)
        }
    }
}
