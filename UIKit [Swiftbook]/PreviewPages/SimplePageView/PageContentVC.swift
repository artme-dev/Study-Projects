//
//  PageContentVC.swift
//  SimplePageView
//
//  Created by Артём on 21.06.2021.
//

import UIKit

class PageContentVC: UIViewController {

    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var label: UILabel!
    
    var titleText = ""
    var totalPageCount = 0
    var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = titleText
        pageControl.numberOfPages = totalPageCount
        pageControl.currentPage = currentPageIndex
    }
}
