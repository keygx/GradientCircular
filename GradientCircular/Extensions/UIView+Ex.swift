//
//  UIView+Ex.swift
//  GradientCircular
//
//  Created by keygx on 2018/05/24.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

extension UIView {
    func toUIImage(alpha: CGFloat) -> UIImage {
        if alpha < 1.0 {
            self.alpha = alpha
        }
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
        /***
         CGImageMaskCreate: invalid mask bits/component: 16.
         */
        /*if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
            return renderer.image { rendererContext in
                self.layer.render(in: rendererContext.cgContext)
            }
        } else {
            let scale = UIScreen.main.scale
            UIGraphicsBeginImageContextWithOptions(self.frame.size, false, scale)
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image!
        }*/
    }
}
