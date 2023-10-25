//
//  LoginViewController.swift
//  Chat App
//
//  Created by VJB-IT on 2/4/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo")
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image!, textField: passwordTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account?", " Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    
    // MARK: - Selectors
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.shared.logUserIn(with: email, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }
            guard let window = UIApplication.shared.windows.first(where:  { $0.isKeyWindow}) else {
                return
            }
            guard let tab = window.rootViewController as? MainTabBarController else { return }
            tab.authenticateUserAndConfigureUI()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    @objc func handleShowSignUp() {
        let controller = RegisterViewController()
        self.navigationController?.pushViewController(controller, animated: true)

       
    }
     
    // MARK: - Helpers
    func configureUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
       
        view.addSubview(logoImage)
        logoImage.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImage.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: logoImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 30, paddingRight: 30)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
        
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor(red: 46.0/255.0, green: 173.0/255.0, blue: 227.0/255.0, alpha: 1.0).cgColor
//        textField.layer.borderWidth = 1.5
//        textField.layer.cornerRadius = 5.0
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0).cgColor
//        textField.layer.borderWidth = 0.5
//        textField.layer.cornerRadius = 5.0
//    }
    
}
