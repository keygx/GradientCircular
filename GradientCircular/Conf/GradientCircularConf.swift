//
//  GradientCircularConf.swift
//  GradientCircular
//
//  Created by keygx on 2018/05/24.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

public enum GradientCircularConf {
    // Style
    public struct Style {
        public var rect: CGRect
        public var lineWidth: CGFloat
        public var gradient: (start: UIColor, end: UIColor)
        
        public var radius: CGFloat {
            return (rect.size.width - lineWidth) / 2.0
        }
        
        public let lineCap: CGLineCap = CGLineCap.butt
        
        public init(frame: CGRect, lineWidth: CGFloat, gradient: (UIColor, UIColor)) {
            self.rect = frame
            self.lineWidth = lineWidth
            self.gradient = gradient
        }
        
        func setColorSingle(color: UIColor) -> Style {
            return Style(frame: self.rect, lineWidth: self.lineWidth, gradient: (color, color))
        }
        
        func setColorGrayScale(startAlpha: CGFloat, endAlpha: CGFloat, clockwise: Bool) -> Style {
            if clockwise {
                let gray = UIColor(red: 1.0 - startAlpha, green: 1.0 - startAlpha, blue: 1.0 - startAlpha, alpha: 1.0)
                return Style(frame: self.rect, lineWidth: self.lineWidth, gradient: (gray, UIColor.white))
            } else {
                let gray = UIColor(red: 1.0 - endAlpha, green: 1.0 - endAlpha, blue: 1.0 - endAlpha, alpha: 1.0)
                return Style(frame: self.rect, lineWidth: self.lineWidth, gradient: (UIColor.white, gray))
            }
        }
    }
}
