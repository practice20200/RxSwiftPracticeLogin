//
//  ViewController.swift
//  RxSwiftPracticeLogin
//
//  Created by Apple New on 2022-06-09.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    
    lazy var titleLable : UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = .systemGray6
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return tf
    }()
    
    lazy var passwordTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = .systemGray6
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return tf
    }()
    
    lazy var loginBTN : UIButton = {
        let btn = UIButton()
        btn.setTitle("Log in", for:.normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(loginHandler), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 5
        btn.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return btn
    }()
    
    lazy var contentStack: VStack = {
        let stack = VStack()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(titleLable)
        stack.addArrangedSubview(emailTF)
        stack.addArrangedSubview(passwordTF)
        stack.addArrangedSubview(loginBTN)
        stack.spacing = 10
        stack.alignment = .center
        stack.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return stack
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(contentStack)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
        
//            contentStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            contentStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            contentStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            
        ])
        
        emailTF.becomeFirstResponder()
        
        emailTF.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.usernameTextPublishSubject).disposed(by: disposeBag)
        passwordTF.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
        
        loginViewModel.isValid().bind(to: loginBTN.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map{$0 ? 1 : 0.1}.bind(to: loginBTN.rx.alpha).disposed(by: disposeBag)
        
    }
    

    @objc func loginHandler(){
        print("Tapped")
    }
    
}




