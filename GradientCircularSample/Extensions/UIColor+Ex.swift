//
//  UIColor+Ex.swift
//  GradientCircularSample
//
//  Created by keygx on 2018/05/27.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

extension UIColor {
    func toRGBA() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return (r, g, b, a)
    }
}
