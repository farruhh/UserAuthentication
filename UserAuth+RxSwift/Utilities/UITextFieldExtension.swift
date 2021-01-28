//
//  UITextFieldExtension.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/28.
//

import UIKit

extension UITextField {
    func applyCustomEffect() {
        self.borderStyle = .none
        //Basic texfield Setup
        self.borderStyle = .none
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderColor = .none
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
}
