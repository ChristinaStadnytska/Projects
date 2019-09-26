//
//  GeneralPageViewController.swift
//  Wallpaper App
//
//  Created by XP on 9/19/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit

class GeneralPageViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: ShakeButton! {
        didSet {
            skipButton.layer.cornerRadius = skipButton.frame.height / 2
            skipButton.shake()
        }
    }
    
    //MARK: - instance of the StartPageVC
    var startPageVC: StartPageVC?
    
    //MARK: - prepareForSegue to initiate delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? StartPageVC {
            startPageVC = pageViewController
            startPageVC?.walkthroughDelegate = self
        }
    }
    
    //MARK: - IBActions
    @IBAction func tappedSkipButton(_ sender: ShakeButton) {
    }

}

//MARK: - WalkthroughPageControlDelegate
extension GeneralPageViewController: WalkthroughPageControlDelegate {    
    func didUpdatePageIndex(index: Int) {
        if let index = startPageVC?.currentIndex {
            pageControl.currentPage = index
        }
    }
}
