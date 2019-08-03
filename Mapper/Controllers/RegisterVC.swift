//
//  RegisterVC.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 7/30/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import Firebase



class RegisterVC: UIViewController, UITextFieldDelegate {
    
    let background: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pexels-photo-24821"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let effect: UIVisualEffectView = {
        let effect = UIVisualEffectView()
        effect.translatesAutoresizingMaskIntoConstraints = false
        return effect
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "cancelBtn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let lefttPartTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Map"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .red
        return label
    }()
    
    
    let rightPartTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "per"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .black
        return label
    }()
    
    let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .yellow
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    let descriptionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Sign up or login to start requesting rides with Mapper: the easiest way to get a lift anywhere!"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let segment: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Passenger", "Driver"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.selectedSegmentIndex = 0
        seg.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return seg
    }()
    
    let emailTextfield: RectTextfField = {
        let text = RectTextfField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Email"
        text.font = UIFont.systemFont(ofSize: 30)
        text.textColor = .black
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 10
        text.backgroundColor = .white
        return text
    }()
    
    
    let passwordTextfield: RectTextfField = {
        let text = RectTextfField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Password"
        text.font = UIFont.systemFont(ofSize: 30)
        text.textColor = .black
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 10
        text.backgroundColor = .white
        text.isSecureTextEntry = true
        return text
    }()
    
    
    
    let topStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .yellow
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    let registerButton: ButtonShadow = {
        let button = ButtonShadow(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SIGN UP / LOGIN", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        view.HabdleKeyboard()
        view.addSubview(background)
        view.addSubview(effect)
        view.addSubview(closeButton)
        view.addSubview(topStack)
        topStack.addArrangedSubview(titleStack)
        titleStack.addArrangedSubview(lefttPartTitle)
        titleStack.addArrangedSubview(rightPartTitle)
        topStack.addArrangedSubview(descriptionTitle)
        topStack.addArrangedSubview(segment)
        topStack.addArrangedSubview(emailTextfield)
        topStack.addArrangedSubview(passwordTextfield)
        view.addSubview(registerButton)
        
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleScreenTappedAction))
        view.addGestureRecognizer(tapRecognizer)
        NSLayoutConstraint.activate([
            
            background.widthAnchor.constraint(equalTo: view.widthAnchor),
            background.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            effect.widthAnchor.constraint(equalTo: view.widthAnchor),
            effect.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            topStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            topStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            topStack.heightAnchor.constraint(equalToConstant: 300),
            
            emailTextfield.heightAnchor.constraint(equalToConstant: 50),
            emailTextfield.widthAnchor.constraint(equalTo: topStack.widthAnchor),
            
            passwordTextfield.heightAnchor.constraint(equalToConstant: 50),
            passwordTextfield.widthAnchor.constraint(equalTo: topStack.widthAnchor),
            
            segment.heightAnchor.constraint(equalToConstant: 40),
            segment.widthAnchor.constraint(equalTo: topStack.widthAnchor),
            
            descriptionTitle.widthAnchor.constraint(equalTo: topStack.widthAnchor),
            
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 60),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            
            ])
        
    }
    
    
    @objc func closeAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleScreenTappedAction(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @objc func registerAction(){
        if emailTextfield.text != nil && passwordTextfield.text != nil {
            registerButton.animatedButton(shouldLoad: true, message: nil)
            self.view.endEditing(true)
            
            if let email = emailTextfield.text, let password = passwordTextfield.text {
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if error == nil {
                        if let user = Auth.auth().currentUser?.uid {
                            if self.segment.selectedSegmentIndex == 0 {
                                let userData = ["provider" : user] as [String : Any]
                                DataService.instance.createFirebaseDBUser(uid: PhoneAuthProviderID, userData: userData, isDriver: false)
                            } else {
                                let userData = ["provider" : user, "userIsDriver" : true, "isPickUpModeEnabled" : false, "driverIsOnTrip" : false] as [String : Any]
                                DataService.instance.createFirebaseDBUser(uid: PhoneAuthProviderID, userData: userData, isDriver: true)
                            }
                        }
                        print("Email user authentication seccess")
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        
                        if let errorCode = AuthErrorCode(rawValue: error!._code) {
                            
                            switch errorCode {
                            case .wrongPassword:
                                print("wrongPassword")
                            default:
                                print("Unexpected Error")
                            }
                        }
                        
                        
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                                    
                                    switch errorCode {
                                        
                                    case .emailAlreadyInUse:
                                        print("emailAlreadyInUse")
                                    case .invalidEmail:
                                        print("Invalid Email")
                                    default:
                                        print("Unexpected Error")
                                    }
                                }
                            } else {
                                if let user = Auth.auth().currentUser?.uid{
                                    if self.segment.selectedSegmentIndex == 0 {
                                        let userData = ["provider" : user] as [String : Any]
                                        DataService.instance.createFirebaseDBUser(uid: user, userData: userData, isDriver: false)
                                    } else {
                                        let userData = ["provider" : PhoneAuthProviderID, "userIsDriver" : true, "isPickUpModeEnabled" : false, "driverIsOnTrip" : false] as [String : Any]
                                        DataService.instance.createFirebaseDBUser(uid: user, userData: userData, isDriver: true)
                                    }
                                }
                                print("creating user success")
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    }
                }
            }
        }
    }
}
