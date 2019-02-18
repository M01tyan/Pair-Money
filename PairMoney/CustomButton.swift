//
//  CustomButton.swift
//  Household
//
//  Created by 前田幹太 on 2019/02/03.
//  Copyright © 2019 M01tyan. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
    }
}
