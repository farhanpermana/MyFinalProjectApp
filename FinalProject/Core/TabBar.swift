//
//  TabBar.swift
//  FinalProject
//
//  Created by Farhan on 10/04/23.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    func setupVC() {
        viewControllers = [
            createNavController(viewController: HomeViewController(), title: "Home", image: UIImage(systemName: "house")!),
            createNavController(viewController: HomeViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass")!),
            createNavController(viewController: ProfileController(), title: "Profile", image: UIImage(systemName: "person")!),
            
        ]
        
        
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        viewController.navigationItem.title = title
        
        return navController
    }
    
    

}
