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
    lazy var viewModel = ContactsListViewModel()
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        viewModel.delegate = self
        let viewController = ContactsListViewController(viewModel: self.viewModel)
        rootViewController.setViewControllers([viewController], animated: false)
    }
    
    func goToContactCreation() {
        let coordinator = CreateContactCoordinator(rootViewController: self.rootViewController)
        coordinator.delegate = self
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension ContactsListCoordinator: ContactsListViewModelDelegate {
    func contactsListViewModelDidTapCreateContact() {
        goToContactCreation()
    }
}

extension ContactsListCoordinator: CreateContactCoordinatorOutput {
    func didFinish(from coordinator: CreateContactCoordinator) {
        removeChildCoordinator(coordinator)
    }
}
