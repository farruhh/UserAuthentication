//
//  AppDelegate.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/18.
//

import UIKit
import Firebase
import CocoaLumberjack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: MainCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DDLog.add(DDOSLogger.sharedInstance)
        coordinator = MainCoordinator(navigationController: UINavigationController())
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard.splashViewController()
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
//        coordinator?.start()
        
        return true
    }
}

