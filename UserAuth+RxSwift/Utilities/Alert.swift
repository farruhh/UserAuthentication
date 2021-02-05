//
//  Alert.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/31.
//

import Foundation
import UIKit

class Alert {
    func showAlert(title: String?, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
