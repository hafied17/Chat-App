//
//  RegisterViewController.swift
//  Chat App
//
//  Created by VJB-IT on 2/4/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    // MARK: Properties
    
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "plus_photo")
        return iv
    }()
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account?", " Login")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
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
    private lazy var usernameContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x.png")
        let view = Utilities().inputContainerView(withImage: image, textField: usernameTextField)
        return view
    }()
    private lazy var fullNameContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x.png")
        let view = Utilities().inputContainerView(withImage: image, textField: fullNameTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.textContentType = .password
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Username")
        return tf
    }()
    private let fullNameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Full Name")
        return tf
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    
    }()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @objc func handleAddProfilePhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - Selectors
    @objc func handleShowLogin() {
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleRegistration() {
        guard let profileImage = profileImage else {
            print("choose image")
            return
        }

        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        
        let credentials = AuthCredentials.init(email: email, password: password, fullname: fullName, username: username, profileImage: profileImage)
        AuthService.shared.registerUser(credentials: credentials){ (error, ref) in
            print("success")
        }
    }
     
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(plusButton)
        plusButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusButton.setDimensions(width: 128, height: 128)
        
        let stack = UIStackView(arrangedSubviews: [usernameContainerView,fullNameContainerView,emailContainerView,passwordContainerView,registrationButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: plusButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 30, paddingRight: 30)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 30, paddingRight: 30)
    }

}

// MARK: - UIImagePickerControllerDelegate

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        
        plusButton.layer.cornerRadius = 128/2
        plusButton.layer.masksToBounds = true
        plusButton.imageView?.contentMode = .scaleAspectFill
        plusButton.layer.borderWidth = 3
        plusButton.layer.borderColor = UIColor.white.cgColor
        
        self.plusButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        
        dismiss(animated: true, completion: nil)
        
    }
}
