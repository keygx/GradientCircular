//
//  PagesViewController.swift
//  GradientCircularSample
//
//  Created by keygx on 2018/05/24.
//  Copyright © 2018年 keygx. All rights reserved.
//

import UIKit
import GradientCircular

protocol PageItemType {
    var pageIndex: Int { get }
    var style: GradientCircularConf.Style? { get set }
}

class PagesViewController: UIPageViewController {
    weak var textView: UITextView?
    weak var pageControl: UIPageControl?
    var pageViewControllers: [UIViewController] = []
    var currentIndex = 0
    let sb = UIStoryboard(name:"Pages", bundle:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewControllers = [createInstance(identifier: "BlueArcViewController"),
                               createInstance(identifier: "OrageClearArcViewController"),
                               createInstance(identifier: "AlphaCompositeViewController"),
                               createInstance(identifier: "SingleColorViewController"),
                               createInstance(identifier: "SingleAlphaColorViewController")]
        
        setViewControllers([pageViewControllers.first!], direction: .forward, animated: true, completion: nil)
        dataSource = self
        delegate = self
        
        pageControl?.currentPage = currentIndex
        pageControl?.numberOfPages = pageViewControllers.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textView?.text = convertDisplayStyle(style: (pageViewControllers[currentIndex] as! PageItemType).style!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PagesViewController {
    func createInstance(identifier: String) -> UIViewController {
        return sb.instantiateViewController(withIdentifier: identifier) as UIViewController
    }
    
    func convertDisplayStyle(style: GradientCircularConf.Style) -> String {
        let converted = """
        [radius] \(style.radius)
        [line width] \(style.lineWidth)
        [start color] r: \(style.gradient.start.toRGBA().r * 255.0), g: \(style.gradient.start.toRGBA().g * 255.0), b: \(style.gradient.start.toRGBA().b * 255.0), a: \(style.gradient.start.toRGBA().a)
        [end color] r: \(style.gradient.end.toRGBA().r * 255.0), g: \(style.gradient.end.toRGBA().g * 255.0), b: \(style.gradient.end.toRGBA().b * 255.0), a: \(style.gradient.end.toRGBA().a)
        """
        return converted
    }
}

extension PagesViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController:UIViewController) -> UIViewController? {
        guard let index = pageViewControllers.index(of: viewController) else { return nil }
        if index == 0 {
            return nil
        }
        return pageViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewControllers.index(of: viewController) else { return nil }
        if index == pageViewControllers.count - 1 {
            return nil
        }
        return pageViewControllers[index + 1]
    }
}

extension PagesViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            return
        }
        
        if let vc = viewControllers?.first as? PageItemType {
            currentIndex = vc.pageIndex
            pageControl?.currentPage = currentIndex
            textView?.text = convertDisplayStyle(style: vc.style!)
        }
    }
}
