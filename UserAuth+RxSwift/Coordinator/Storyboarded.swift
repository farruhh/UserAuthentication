//
//  Storyboarded.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/22.
//

import Foundation
import UIKit

/// `Coordinator Pattern: Storyboard initializer Protocol`
/// `Make sure all the VCs confirm to the < StoryBoarded > protocol `
protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() ->  Self {
        let id = String (describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if #available(iOS 13.0, *) {
            return storyboard.instantiateViewController(identifier: id) as! Self
        } else {
            // Fallback on earlier versions
        }
        return instantiate()
    }
}
