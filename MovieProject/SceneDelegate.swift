//
//  SceneDelegate.swift
//  MovieProject
//
//  Created by 여성은 on 6/4/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let firstViewController = UINavigationController(rootViewController: HomeViewController())
        let secondViewController = UINavigationController(rootViewController: BoxOfficeViewController())
        let thirdViewController = UINavigationController(rootViewController: SearchMovieViewController())
        let fourthViewController = UINavigationController(rootViewController: TrendViewController())
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstViewController, secondViewController, thirdViewController, fourthViewController], animated: true)
    
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "house.fill")
            items[0].image = UIImage(systemName: "house")
            items[0].title = "홈"
            
            items[1].selectedImage = UIImage(systemName: "list.bullet.circle.fill")
            items[1].image = UIImage(systemName: "list.bullet.circle")
                        
            items[2].selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
            items[2].image = UIImage(systemName: "magnifyingglass.circle")
            items[2].title = "검색"
            
            items[3].title = "Trend"
        }
        tabBarController.tabBar.tintColor = .white
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

