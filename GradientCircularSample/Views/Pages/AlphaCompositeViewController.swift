//
//  AlphaCompositeViewController.swift
//  GradientCircularSample
//
//  Created by keygx on 2018/05/27.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit
import GradientCircular

class AlphaCompositeViewController: UIViewController, PageItemType {
    let pageIndex = 2
    var style: GradientCircularConf.Style?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        drawGradientCircular()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawGradientCircular() {
        let length = view.frame.size.width - 40
        let rect = CGRect(x: view.center.x - length/2, y: 70.0, width: length, height: length)
        
        let style = GradientCircularConf.Style(frame: rect,
                                               lineWidth: 30.0,
                                               gradient: (UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.8),
                                                          UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.8)))
        self.style = style
        let arcImageView = GradientCircular.drawImageView(style: style)
        view.addSubview(arcImageView)
    }
}
