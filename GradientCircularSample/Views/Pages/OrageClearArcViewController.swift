//
//  OrageClearArcViewController.swift
//  GradientCircularSample
//
//  Created by keygx on 2018/05/26.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit
import GradientCircular

class OrageClearArcViewController: UIViewController, PageItemType {    
    let pageIndex = 1
    var style: GradientCircularConf.Style?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
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
                                               gradient: (UIColor.orange, UIColor.clear))
        self.style = style
        let arcImageView = GradientCircular.drawImageView(style: style)
        view.addSubview(arcImageView)
    }
}
