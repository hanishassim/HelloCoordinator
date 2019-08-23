//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by H on 23/08/2019.
//  Copyright © 2019 H. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate, Buying, AccountCreating {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buy(to prodyctType: Int) {
        // Let childCoordinator to take control from mainCoordinator
        let child = BuyCoordinator(navigationController: navigationController, productType: prodyctType)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.tabBarItem = UITabBarItem.init(tabBarSystemItem: .favorites, tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        guard let child = child else { return }
        
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        // If already in array, do nothing
        if navigationController.contains(fromViewController) {
            return
        }
        
        // If not in array, we pop it from navigation stack
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
}
