//
//  LoginViewController.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/18.
//

import UIKit
import RxSwift
import RxCocoa
import CocoaLumberjack

class LoginViewController: UIViewController, Storyboarded {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    weak var coordinator: MainCoordinator?
    var userViewModel: LogInViewModel = LogInViewModel()
    let disposeBag = DisposeBag()
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.emailTextField.delegate = self
//        self.passwordTextField.delegate = self
        self.emailTextField.placeholder = "Email or Username"
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.isSecureTextEntry = true
        self.emailTextField.applyCustomEffect()
        self.passwordTextField.applyCustomEffect()
        
        self.bindToViewModel()
        self.getCallbacks()
    }
    func bindToViewModel()  {
        self.emailTextField.rx.text.orEmpty.bind(to: userViewModel.emailViewModel.data).disposed(by: disposeBag)
        self.passwordTextField.rx.text.orEmpty.bind(to: userViewModel.passwordViewModel.data).disposed(by: disposeBag)
        self.loginButton.rx.tap.do(onNext: {[unowned self] in
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }).subscribe(onNext: {[unowned self] in
            if self.userViewModel.validateCredentials() {
                self.userViewModel.loginUser()
            }
        }).disposed(by: disposeBag)
    }
    func getCallbacks() {
        userViewModel.isSuccess.asObservable().bind { value in
            DDLogDebug("success: \(value)")
        }.disposed(by: disposeBag)
        userViewModel.errorMessage.asObservable().bind { error in
            DDLogDebug("Error:\(error)")
        }.disposed(by: disposeBag)
    }
}
