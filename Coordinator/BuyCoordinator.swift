//
//  BuyCoordinator.swift
//  Coordinator
//
//  Created by H on 23/08/2019.
//  Copyright © 2019 H. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    var selectedProduct = 0
    
    init(navigationController: UINavigationController, productType: Int) {
        self.navigationController = navigationController
        self.selectedProduct = productType
    }
    
    func start() {
        print("Buying \(selectedProduct)")
        
        let vc = BuyViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
}
