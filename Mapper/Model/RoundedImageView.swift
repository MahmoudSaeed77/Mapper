//
//  RoundedImageView.swift
//  Mapper
//
//  Created by Mohamed Ibrahem on 8/1/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
            roundTheImage()
    }
    
    func roundTheImage(){
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
    }
}
