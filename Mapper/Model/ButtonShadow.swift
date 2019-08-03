//
//  ButtonShadow.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 7/29/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ButtonShadow: UIButton {
    var originalSize: CGRect!
    
    override func awakeFromNib() {
        originalSize = self.frame
        
    }
    
    func dropShadow(){
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize.zero
    }
    
    func animatedButton(shouldLoad: Bool, message: String?){
        let spinner = UIActivityIndicatorView()
        spinner.style = .whiteLarge
        spinner.color = UIColor.darkGray
        spinner.alpha = 0.0
        spinner.hidesWhenStopped = true
        
        spinner.tag = 12
        
        if shouldLoad {
            self.addSubview(spinner)
            self.setTitle("", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
                
            }) { (finished) in
                if finished == true {
                    
                    spinner.startAnimating()
                    spinner.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.width / 2 + 1)
                    UIView.animate(withDuration: 0.2, animations: {
                        spinner.alpha = 1.0
                    })
                }
            }
            self.isUserInteractionEnabled = false
        }else {
            for sub in self.subviews {
                if sub.tag == 12 {
                    sub.removeFromSuperview()
                }
            }
            UIView.animate(withDuration: 0.2) {
                self.layer.cornerRadius = 10
                self.frame = self.originalSize
                self.setTitle(message, for: .normal)
            }
        }
        
    }
    
    
}
