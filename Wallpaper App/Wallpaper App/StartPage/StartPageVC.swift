//
//  StartPageVC.swift
//  Wallpaper App
//
//  Created by XP on 9/16/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit

//MARK: - Delegate protocol to pass page index through ViewControllers
protocol WalkthroughPageControlDelegate: class {
    func didUpdatePageIndex(index: Int)
}


class StartPageVC: UIPageViewController {
    
    weak var walkthroughDelegate: WalkthroughPageControlDelegate?
    
    //MARK: - Variables
    let imagesContent = ["welcome", "search", "enjoy"]
    let textContent = ["Just choose an image 🙌🏻", "Save it 📩", "And enjoy it 💫"]
    var currentIndex = 0

    //MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.dataSource = self
        self.delegate = self
        
        //create the first screen
        if let startingViewController = getViewControllerAtIndex(at: 0) {
            self.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: - Create the initial ViewController
    func getViewControllerAtIndex(at index: Int) -> ContentViewController? {
        
        if index < 0 || index >= imagesContent.count { return nil }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "pageID") as? ContentViewController {
            
            pageContentViewController.img = "\(imagesContent[index])"
            pageContentViewController.text = "\(textContent[index])"
            pageContentViewController.getIndex = index

            return pageContentViewController
        }
        return nil
    }
}

//MARK: - Delegate and DataSource
extension StartPageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentViewController
        
        var index = vc.getIndex
        index -= 1
        
        return getViewControllerAtIndex(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        let vc = viewController as! ContentViewController

        var index = vc.getIndex
        index += 1
                
        return getViewControllerAtIndex(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let contentViewController = pageViewController.viewControllers?.first as? ContentViewController {
            currentIndex = contentViewController.getIndex
            walkthroughDelegate?.didUpdatePageIndex(index: currentIndex)
        }
    }
    
}
