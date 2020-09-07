//
//  AppCoordinator.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    // MARK: - Properties
    let window: UIWindow
    
    let rootViewController: UINavigationController = UINavigationController()
    
    // MARK: - Coordinator
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let coordinator = CreateContactCoordinator(rootViewController: rootViewController)
        self.addChildCoordinator(coordinator)
        coordinator.start()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {
    }
}

