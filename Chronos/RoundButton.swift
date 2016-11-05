//
//  RoundButton.swift
//  Chronos
//
//  Created by Gianni Bacchiocchi on 01/11/16.
//  Copyright © 2016 Gianni Bacchiocchi. All rights reserved.
//

import UIKit

@IBDesignable open class RoundButton: UIButton {
    
    
    @IBInspectable var fillColor: UIColor = UIColor.clear {
        didSet {
            
            backgroundColor = fillColor        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }


    @IBInspectable var label: String = "" {
        didSet {
            titleLabel!.font = UIFont(name: "DS-Digital", size: 18)
            setTitle(label , for: UIControlState.normal)
        }
    }
    
    
    @IBInspectable var labelColor: UIColor = UIColor.clear {
        didSet {
            
            setTitleColor(labelColor, for: .normal)        }
    }
    
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
    }
}
