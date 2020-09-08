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

extension ContactsListCoordinator: CreateContactCoordinatorOutput {
    func didFinish(from coordinator: CreateContactCoordinator) {
        removeChildCoordinator(coordinator)
    }
}

extension ContactsListCoordinator: ContactsListViewModelDelegate {
    func contactsListViewModelDidTapCreateContact() {
        print("no")
        let coordinator = CreateContactCoordinator(rootViewController: self.rootViewController)
        coordinator.delegate = self
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}
