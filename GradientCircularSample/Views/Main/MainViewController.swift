//
//  MainViewController.swift
//  GradientCircularSample
//
//  Created by keygx on 2018/05/27.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pagesViewController = segue.destination as? PagesViewController {
            pagesViewController.textView = self.textView
            pagesViewController.pageControl = self.pageControl
        }
    }
}
