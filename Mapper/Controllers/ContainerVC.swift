//
//  ContainerVC.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 7/30/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import Firebase

class ContainerVC: UIViewController {
    
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return view
    }()
    
    let topTitle: UILabel = {
        let title = UILabel()
        title.text = "Menu"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 30)
        title.textColor = .white
        return title
    }()
    
    let paymentButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Payment", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return button
    }()
    
    let yourTripsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Your Trips", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return button
    }()
    
    let helpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Help", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Settings", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return button
    }()
    
    let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registration", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return button
    }()
    
    let buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        return stack
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let pickupSwitch: UISwitch = {
        let pick = UISwitch()
        pick.translatesAutoresizingMaskIntoConstraints = false
        return pick
    }()
    
    let PickupModeLabel: UILabel = {
        let title = UILabel()
        title.text = "PICKUP MODE ENABLED"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.textColor = .black
        return title
    }()
    
    let emailLabel: UILabel = {
        let title = UILabel()
        title.text = "mahmoud.saeed298@gmail.com"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 22)
        title.textColor = .black
        return title
    }()
    
    let accountTypeLabel: UILabel = {
        let title = UILabel()
        title.text = "Driver / Passenger"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = .black
        return title
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sample-photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let infoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 15
        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.clipsToBounds = true
        
        
        
        if Auth.auth().currentUser == nil {
            registrationButton.setTitle("Registration", for: .normal)
            pickupSwitch.isOn = false
            pickupSwitch.isHidden = true
            PickupModeLabel.isHidden = true
            emailLabel.text = ""
            accountTypeLabel.text = ""
            profileImageView.isHidden = true
        } else {
            registrationButton.setTitle("Sign out", for: .normal)
            observePassengerAndDriver()
        }
        
        
        
        
        view.addSubview(topView)
        topView.addSubview(topTitle)
        topView.addSubview(backButton)
        topView.addSubview(profileImageView)
        
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(paymentButton)
        buttonsStack.addArrangedSubview(yourTripsButton)
        buttonsStack.addArrangedSubview(helpButton)
        buttonsStack.addArrangedSubview(settingsButton)
        
        
        
        
        view.addSubview(registrationButton)
        
        view.addSubview(infoStack)
        infoStack.addArrangedSubview(pickupSwitch)
        infoStack.addArrangedSubview(PickupModeLabel)
        infoStack.addArrangedSubview(emailLabel)
        infoStack.addArrangedSubview(accountTypeLabel)
        
        
        
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        pickupSwitch.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalToConstant: 150),
            
            topTitle.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            topTitle.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            
            backButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            backButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 50),
            
            
            buttonsStack.topAnchor.constraint(equalTo: topView.bottomAnchor),
            buttonsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.heightAnchor.constraint(equalToConstant: 250),
            
            
            registrationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            registrationButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            
            
            infoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            infoStack.bottomAnchor.constraint(equalTo: registrationButton.topAnchor, constant: -15),
            infoStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            
            
            
            
            ])
        
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
//        if Auth.auth().currentUser == nil {
//            registrationButton.setTitle("Registration", for: .normal)
//            pickupSwitch.isOn = false
//            pickupSwitch.isHidden = true
//            PickupModeLabel.isHidden = true
//            emailLabel.text = ""
//            accountTypeLabel.text = ""
//            profileImageView.isHidden = true
//        } else {
//            registrationButton.setTitle("Sign out", for: .normal)
//            observePassengerAndDriver()
//        }
        
        if pickupSwitch.isOn == true {
            PickupModeLabel.text = "PICKUP MODE ENABLED"
            
            
        } else {
            PickupModeLabel.text = "PICKUP MODE DISABLED"
            
            
        }
    }

    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func registerAction(){
        if Auth.auth().currentUser == nil {
            let vc = RegisterVC()
            navigationController?.present(vc, animated: true, completion: nil)
            
        } else {
            do {
                try Auth.auth().signOut()
                emailLabel.text = ""
                accountTypeLabel.text = ""
                profileImageView.isHidden = true
                pickupSwitch.isHidden = true
                PickupModeLabel.isHidden = true
            } catch(let error) {
                print(error)
            }
            
        }
    }
    
    @objc func switchAction(){
        if pickupSwitch.isOn {
            PickupModeLabel.text = "PICKUP MODE ENABLED"
            DataService.instance.REF_DRIVERS.child((Auth.auth().currentUser?.uid)!).updateChildValues(["isPickUpModeEnabled" : true])
            navigationController?.popViewController(animated: true)
        } else {
            PickupModeLabel.text = "PICKUP MODE DISABLED"
            DataService.instance.REF_DRIVERS.child((Auth.auth().currentUser?.uid)!).updateChildValues(["isPickUpModeEnabled" : false])
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    func observePassengerAndDriver(){
        DataService.instance.REF_USERS.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.accountTypeLabel.text = "Passenger"
                        self.profileImageView.isHidden = false
                        self.emailLabel.text = Auth.auth().currentUser?.email
                        self.pickupSwitch.isHidden = true
                        self.PickupModeLabel.isHidden = true
                    }
                }
            }
        })
        
        DataService.instance.REF_DRIVERS.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.accountTypeLabel.text = "Driver"
                        let status = snap.childSnapshot(forPath: "isPickUpModeEnabled").value as! Bool
                        self.pickupSwitch.isOn = status
                        self.emailLabel.text = Auth.auth().currentUser?.email
                        self.profileImageView.isHidden = false
                    }
                }
            }
        })
    }
    
    
}
