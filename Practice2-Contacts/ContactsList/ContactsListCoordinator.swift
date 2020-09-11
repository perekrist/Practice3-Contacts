//
//  ContactsListCoordinator.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class ContactsListCoordinator: Coordinator {
    let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let vewModel = ContactsListViewModel()
        let viewController = ContactsListViewController(viewModel: vewModel)
        rootViewController.setViewControllers([viewController], animated: false)
    }
}
