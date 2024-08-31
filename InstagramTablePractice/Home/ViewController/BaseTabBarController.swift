//
//  BaseTabBarController.swift
//  InstagramTablePractice
//
//  Created by Sreang on 29/8/24.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    
    private let homeBarController : UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.view.backgroundColor = .blue
        return tabBarController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(homeBarController)
    }
}
