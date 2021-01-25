//
//  UserProfileViewController.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/22.
//

import UIKit

class UserProfileViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
