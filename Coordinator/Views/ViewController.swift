//
//  ViewController.swift
//  Coordinator
//
//  Created by H on 23/08/2019.
//  Copyright © 2019 H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: (Buying & AccountCreating)?
    @IBOutlet weak var product: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buy(to: product.selectedSegmentIndex)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
}
