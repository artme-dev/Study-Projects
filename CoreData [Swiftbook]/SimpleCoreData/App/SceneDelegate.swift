//
//  SceneDelegate.swift
//  SimpleCoreData
//
//  Created by Артём on 20.08.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        window.rootViewController = UINavigationController(rootViewController: TasksTableViewController())
        window.makeKeyAndVisible()
        self.window = window
    }
}

