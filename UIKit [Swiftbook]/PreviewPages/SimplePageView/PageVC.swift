//
//  PageVC.swift
//  SimplePageView
//
//  Created by Артём on 21.06.2021.
//

import UIKit

class PageVC: UIPageViewController {
    
    let titles = [
        "Привет!",
        "Это тестовое превью",
        "Удачи тебе :)"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self

        if let pageContentVC = getContentVC(at: 0){
            setViewControllers([pageContentVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func getContentVC(at index: Int) -> UIViewController? {
        guard 0 <= index else { return nil }
        guard index < titles.count else { return nil }
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "PageContentVC") as? PageContentVC else { return nil }
        
        contentVC.totalPageCount = titles.count
        contentVC.currentPageIndex = index
        contentVC.titleText = titles[index]
        
        return contentVC
    }
}

extension PageVC: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageIndex = (viewController as! PageContentVC).currentPageIndex
        pageIndex -= 1
        
        return getContentVC(at: pageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageIndex = (viewController as! PageContentVC).currentPageIndex
        pageIndex += 1
        
        return getContentVC(at: pageIndex)
    }
    
    
}
