//
//  LabelDigital.swift
//  Chronos
//
//  Created by Gianni Bacchiocchi on 05/11/16.
//  Copyright © 2016 Gianni Bacchiocchi. All rights reserved.
//

import UIKit

class LabelDigital: UILabel {
    
    @IBInspectable var labelColor: UIColor = UIColor.clear {
        didSet {
             textColor = labelColor
        }
    }

    @IBInspectable var label : String = "00:00:00" {
        didSet {
            font = UIFont(name: "DS-Digital", size: 58)
            text = label
        }
    }
}
