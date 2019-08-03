//
//  RectTextfField.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 7/31/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class RectTextfField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 15, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 15, height: bounds.height)
    }
}
