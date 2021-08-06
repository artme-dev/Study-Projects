//
//  TabBarController.swift
//  TabBar
//
//  Created by Артём on 18.06.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            generateNavController(title: "First", tabImage: UIImage(named: "1")!, viewController: FirstViewController()),
            generateNavController(title: "Second", tabImage: UIImage(named: "2")!, viewController: SecondViewController())
        ]
    
        tabBar.isTranslucent = false
        tabBar.tintColor = .purple
        
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance;
    }
    
    func generateNavController(title: String, tabImage: UIImage, viewController vc: UIViewController) -> UINavigationController{
        
        let navController = UINavigationController(rootViewController: vc)
        
        navController.setNavigationBarHidden(true, animated: false)
        navController.tabBarItem.image = tabImage
        navController.tabBarItem.title = title
        return navController
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
