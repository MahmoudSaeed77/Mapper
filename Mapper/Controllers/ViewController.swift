//
//  ViewController.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 7/29/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import RevealingSplashView

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var manager: CLLocationManager?
    var regionRadius: CLLocationDistance = 1000.0
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let lefttPartTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Map"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .red
        return label
    }()
    
    let rightPartTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "per"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    
    let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .yellow
        stack.distribution = .fill
        return stack
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menuSliderBtn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sample-photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    let topLocationStatusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 7.5
        return view
    }()
    
    
    let bottomLocationStatusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 7.5
        return view
    }()
    
    let myLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Location"
        return label
    }()
    
    let targetTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Where are you going?"
        return text
    }()
    
    let myLocationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let targetView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let seperateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let centerMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "centerMapBtn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Standard", "Satellite", "Hybird"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    let buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let requestRideButton = ButtonShadow(type: .system)
    let revealing = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 100, height: 100), backgroundColor: .white)
    
    let locationView = ViewShadow()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        manager = CLLocationManager()
//        manager?.desiredAccuracy = kCLLocationAccuracyBest
//        checkLocationAuthStatus()
        mapView.delegate = self
        centerMapOnUserLocation()
        
        
        setupView()
        addTargets()
        setupConstraints()
    }
    
    
    @objc func segmentAction(sender: UISegmentedControl){
        switch segment.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func requestAction(sender: UIButton){
        requestRideButton.animatedButton(shouldLoad: true, message: nil)
    }
    
    @objc func menuAction(){
        let vc = ContainerVC()
        navigationController?.show(vc, sender: Any?.self)
    }
    
    @objc func centerAction(){
        centerMapOnUserLocation()
    }
    
    
    func checkLocationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            
            manager?.delegate = self
            manager?.startUpdatingLocation()
        }else{
            manager?.requestAlwaysAuthorization()
        }
    }
    
    func centerMapOnUserLocation(){
        let initialLocation = CLLocation(latitude: 30.219260, longitude: 31.182380)

//        let coordinateRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: regionRadius * 2, longitudinalMeters: regionRadius * 2)
        
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}

//extension ViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        checkLocationAuthStatus()
//        if status == .authorizedAlways {
//            mapView.showsUserLocation = true
//            mapView.userTrackingMode = .follow
//        }
//    }
//}

