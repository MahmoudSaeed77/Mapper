//
//  ViewShadow.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 7/29/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ViewShadow: UIView {
    func dropShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
    }
}
