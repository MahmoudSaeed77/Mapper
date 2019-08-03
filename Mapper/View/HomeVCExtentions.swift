//
//  HomeVCExtentions.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 8/3/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import RevealingSplashView

extension ViewController {
    
    func setupView(){
        view.backgroundColor = .white
        view.clipsToBounds = true
        
        view.addSubview(revealing)
        revealing.animationType = SplashAnimationType.heartBeat
        revealing.startAnimation()
        revealing.heartAttack = true
        
        
        locationView.backgroundColor = .white
        locationView.translatesAutoresizingMaskIntoConstraints = false
        locationView.layer.cornerRadius = 10
        locationView.dropShadow()
        
        
        
        requestRideButton.translatesAutoresizingMaskIntoConstraints = false
        requestRideButton.setTitle("REQUEST RIDE", for: .normal)
        requestRideButton.backgroundColor = .white
        requestRideButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        requestRideButton.setTitleColor(.black, for: .normal)
        requestRideButton.layer.cornerRadius = 10
        requestRideButton.dropShadow()
        
        
        
        view.addSubview(mapView)
        view.addSubview(segment)
        
        view.addSubview(topView)
        
        
        topView.addSubview(moreButton)
        topView.addSubview(profileImageView)
        topView.addSubview(titleStack)
        titleStack.addArrangedSubview(lefttPartTitle)
        titleStack.addArrangedSubview(rightPartTitle)
        
        view.addSubview(locationView)
        locationView.addSubview(seperateView)
        locationView.addSubview(myLocationView)
        myLocationView.addSubview(topLocationStatusView)
        myLocationView.addSubview(myLocationLabel)
        
        locationView.addSubview(targetView)
        targetView.addSubview(bottomLocationStatusView)
        targetView.addSubview(targetTextField)
        
        view.addSubview(buttonView)
        buttonView.addSubview(requestRideButton)
        view.addSubview(centerMapButton)
    }
    
    
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100),
            
            
            mapView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            
            
            moreButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            moreButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 50),
            moreButton.widthAnchor.constraint(equalToConstant: 50),
            
            profileImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
            profileImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            
            titleStack.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            titleStack.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleStack.heightAnchor.constraint(equalToConstant: 50),
            
            lefttPartTitle.leadingAnchor.constraint(equalTo: titleStack.leadingAnchor),
            rightPartTitle.trailingAnchor.constraint(equalTo: titleStack.trailingAnchor),
            
            locationView.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 8),
            locationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            locationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            locationView.heightAnchor.constraint(equalToConstant: 100),
            
            myLocationView.topAnchor.constraint(equalTo: locationView.topAnchor),
            myLocationView.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
            myLocationView.trailingAnchor.constraint(equalTo: locationView.trailingAnchor),
            myLocationView.heightAnchor.constraint(equalToConstant: 49.5),
            
            topLocationStatusView.centerYAnchor.constraint(equalTo: myLocationView.centerYAnchor),
            topLocationStatusView.leadingAnchor.constraint(equalTo: myLocationView.leadingAnchor, constant: 15),
            topLocationStatusView.heightAnchor.constraint(equalToConstant: 15),
            topLocationStatusView.widthAnchor.constraint(equalToConstant: 15),
            
            myLocationLabel.leadingAnchor.constraint(equalTo: topLocationStatusView.trailingAnchor, constant: 15),
            myLocationLabel.trailingAnchor.constraint(equalTo: myLocationView.trailingAnchor, constant: -15),
            myLocationLabel.centerYAnchor.constraint(equalTo: myLocationView.centerYAnchor),
            
            
            targetView.bottomAnchor.constraint(equalTo: locationView.bottomAnchor),
            targetView.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
            targetView.trailingAnchor.constraint(equalTo: locationView.trailingAnchor),
            targetView.heightAnchor.constraint(equalToConstant: 49.5),
            
            
            bottomLocationStatusView.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
            bottomLocationStatusView.leadingAnchor.constraint(equalTo: targetView.leadingAnchor, constant: 15),
            bottomLocationStatusView.heightAnchor.constraint(equalToConstant: 15),
            bottomLocationStatusView.widthAnchor.constraint(equalToConstant: 15),
            
            targetTextField.leadingAnchor.constraint(equalTo: bottomLocationStatusView.trailingAnchor, constant: 15),
            targetTextField.trailingAnchor.constraint(equalTo: targetView.trailingAnchor, constant: -15),
            targetTextField.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
            
            seperateView.topAnchor.constraint(equalTo: myLocationView.bottomAnchor),
            seperateView.bottomAnchor.constraint(equalTo: targetView.topAnchor),
            seperateView.centerXAnchor.constraint(equalTo: locationView.centerXAnchor),
            seperateView.widthAnchor.constraint(equalTo: locationView.widthAnchor, multiplier: 0.8),
            
            
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 90),
            
            requestRideButton.topAnchor.constraint(equalTo: buttonView.topAnchor),
            requestRideButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            requestRideButton.widthAnchor.constraint(equalTo: buttonView.widthAnchor, multiplier: 0.8),
            requestRideButton.heightAnchor.constraint(equalToConstant: 60),
            
            centerMapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            centerMapButton.bottomAnchor.constraint(equalTo: requestRideButton.topAnchor, constant: -40),
            centerMapButton.heightAnchor.constraint(equalToConstant: 50),
            centerMapButton.widthAnchor.constraint(equalToConstant: 50),
            
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segment.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 15),
            segment.widthAnchor.constraint(equalTo: locationView.widthAnchor)
            
            
            
            ])
    }
    
    func addTargets(){
        segment.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        requestRideButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        centerMapButton.addTarget(self, action: #selector(centerAction), for: .touchUpInside)
    }
    
    
}
