//
//  CreateContactCoordinator.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 07.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class CreateContactCoordinator: Coordinator {
    let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let viewModel = CreateContactViewModel()
        let viewController = CreateContactViewController(viewModel: viewModel)
        rootViewController.setViewControllers([viewController], animated: false)
    }
}
