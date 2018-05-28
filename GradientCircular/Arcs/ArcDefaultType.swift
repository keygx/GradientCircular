//
//  ArcDefaultType.swift
//  GradientCircular
//
//  Created by keygx on 2018/05/28.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

protocol ArcDefaultType: class {
    var style: GradientCircularConf.Style? { get set }
}

extension ArcDefaultType where Self: UIView {
    func inirialize() {
        backgroundColor = UIColor.clear
        isOpaque = true
    }
    
    func drawImage(style: GradientCircularConf.Style) -> UIImage {
        self.style = style
        
        if self is SingleColorArcView {
            return toUIImage(alpha: style.gradient.start.toRGBA().a)
        }
        return toUIImage(alpha: 1.0)
    }
}
