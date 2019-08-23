//
//  Storyboarded.swift
//  Coordinator
//
//  Created by H on 23/08/2019.
//  Copyright © 2019 H. All rights reserved.
//

import UIKit

protocol Storyboarded {
    // Returns self - when called will return the type
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    // To instatiate the vc with the same sotryboard id
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        
        return  storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
