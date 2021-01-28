//
//  ValidationViewModel.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/01/28.
//

import Foundation
import RxSwift
import RxCocoa

protocol ValidationViewModel {
    var errorMessage: String { get }
    var data: BehaviorRelay<String> { get set }
    var errorValue: BehaviorRelay<String?> { get }
    
    func validateCredentials() -> Bool 
}
