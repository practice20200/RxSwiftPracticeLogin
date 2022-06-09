//
//  LoginViewModel.swift
//  RxSwiftPracticeLogin
//
//  Created by Apple New on 2022-06-09.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
 
class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable().startWith("")).map {
            username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}
