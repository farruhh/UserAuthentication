//
//  SplashViewController.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/25.
//

import UIKit
import Lottie
import CocoaLumberjack
import Firebase

class SplashViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let animationView = AnimationView()
        let animation = Animation.named("Lottie", bundle: Bundle.main)
        animationView.animation = animation
        animationView.frame = CGRect(origin: .zero, size: CGSize(width: animationView.frame.size.width, height: animationView.frame.size.height))
        animationView.center = self.view.center
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.play(completion: { (completed) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                if let existUser = AppSettings.sharedUser(), existUser.isValidUser() {
                    DDLogDebug("Attemting to Auto-Login.. . ")
                    Auth.auth().signIn(withEmail: existUser.username, password: existUser.password, completion: {(success, error) in
                        if (error != nil) {
                            AppSettings.sharedUser(User.init(existUser.username, password: existUser.password))
                            UIApplication.appDelegate().coordinator?.start()
                            return
                        } else {
                            DDLogDebug("Failed to Auto-Login: \(String(describing: error?.localizedDescription)))")
                            UIApplication.appDelegate().window?.rootViewController = UIStoryboard.logInViewConroller()
                        }
                    })
                } else {
                    DDLogWarn("Invalid User")
                    UIApplication.rootLoginViewController()
                }
            })
        })
        view.addSubview(animationView)
    }
}
