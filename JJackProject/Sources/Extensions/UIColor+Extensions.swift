//
//  UIColor+Extensions.swift
//  JJackProject
//
//  Created by SangIl Mo on 25/06/2019.
//  Copyright © 2019 SangIl Mo. All rights reserved.
//

import UIKit

extension UIColor {
    @nonobjc class var brownishGrey: UIColor {
        return UIColor(white: 102.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var dotCol: UIColor {
        return UIColor(white: 238.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var JackBlack: UIColor {
        return UIColor(red: 17.0 / 255.0, green: 17.0 / 255.0, blue: 17.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var brownGrey: UIColor {
        return UIColor(white: 153.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var mainCol: UIColor {
        return UIColor(red: 1.0, green: 194.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var pointCol: UIColor {
        return UIColor(red: 218.0 / 255.0, green: 72.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightPink: UIColor {
        return UIColor(white: 200.0 / 255.0, alpha: 1.0)
    }

}

extension UIFont {
    
    @nonobjc class var Bold: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 20.0)!
    }
    
    @nonobjc class var Bold2: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 16.0)!
    }
    @nonobjc class var Light2: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Light", size: 16.0)!
    }
}
