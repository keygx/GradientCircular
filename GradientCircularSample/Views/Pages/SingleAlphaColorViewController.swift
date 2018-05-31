//
//  SingleAlphaColorViewController.swift
//  GradientCircularSample
//
//  Created by keygx on 2018/05/31.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit
import GradientCircular

class SingleAlphaColorViewController: UIViewController, PageItemType {
    let pageIndex = 4
    var style: GradientCircularConf.Style?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
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
                                               gradient: (UIColor(red: 51.0/255.0, green: 153.0/255.0, blue: 1.0, alpha: 0.6),
                                                          UIColor(red: 51.0/255.0, green: 153.0/255.0, blue: 1.0, alpha: 0.6)))
        self.style = style
        let arcImageView = GradientCircular.drawImageView(style: style)
        view.addSubview(arcImageView)
    }
}
