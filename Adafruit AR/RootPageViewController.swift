//
//  RootPageViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 9/10/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import Foundation

public var pageControl = UIPageControl()

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate  {

  
  lazy var viewControllerList: [UIViewController] = {
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    let vc1 = sb.instantiateViewController(withIdentifier: "oneVC")
    let vc2 = sb.instantiateViewController(withIdentifier: "twoVC")
    let vc3 = sb.instantiateViewController(withIdentifier: "threeVC")
    
    return [vc1, vc2, vc3]
    
  }()
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

    // Do any additional setup after loading the view.
   
    self.dataSource = self
    self.delegate = self
    if let firstViewController = viewControllerList.first {
      self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
    }
    configPageControl()
  }

  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  
  func configPageControl() {
   
    pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width:
      UIScreen.main.bounds.width, height: 50))
    
    pageControl.numberOfPages = viewControllerList.count
    pageControl.currentPage = 0
    pageControl.tintColor = UIColor.lightGray
    pageControl.currentPageIndicatorTintColor = UIColor.white
    pageControl.pageIndicatorTintColor = UIColor.lightGray
    self.view.addSubview(pageControl)
  }
  
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    let pageContentViewController = pageViewController.viewControllers![0]
    pageControl.currentPage = viewControllerList.index(of: pageContentViewController)!
  }
  
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
    let previousIndex = vcIndex - 1
    
    guard previousIndex >= 0 else {return nil}
    
    guard viewControllerList.count > previousIndex else {return nil}
    return viewControllerList[previousIndex]

  }
  

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
    
    let nextIndex = vcIndex + 1
    
    guard viewControllerList.count != nextIndex else {return nil}
    
    guard viewControllerList.count > nextIndex else {return nil}
    
    return viewControllerList[nextIndex]
    
  }

}
