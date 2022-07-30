//
//  LoginViewController.swift
//  uber-uikit
//
//  Created by Wagão on 30/07/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont(name: "Avenir-Light", size: 36)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = #imageLiteral(resourceName: "email")
        let view = Utilities().inputContainerView(withImage: image, textField: emailTextInput)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = #imageLiteral(resourceName: "lock")
        let view = Utilities().inputContainerView(withImage: image, textField: passwordTextInput)
        return view
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().atttributedButton("Don't have an account? ", "Sign Up")
        button.addTarget(self, action: #selector(handleNavigateToSignUp), for: .touchUpInside)
        return button
    }()
    
    private let emailTextInput: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        tf.placeholder = "Email"
        return tf
    }()
    
    private let passwordTextInput: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    
    //MARK: - Helpers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI(){
        view.backgroundColor = #colorLiteral(red: 0.1294793785, green: 0.1294793785, blue: 0.1294793785, alpha: 0.9105360589)
        
        view.addSubview(titleLabel)
        titleLabel.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 16, paddingRight: 40)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    
    //MARK: - API
    
    //MARK: - Selectors
    
    @objc func handleLogin() {
        print("DEBUG: Clicou....")
    }
    
    @objc func handleNavigateToSignUp(){
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
