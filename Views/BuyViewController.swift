//
//  BuyViewController.swift
//  Coordinator
//
//  Created by H on 23/08/2019.
//  Copyright © 2019 H. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator?
    var selectedProduct = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        
//        coordinator?.didFinishBuying()
//    }
}
