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
        let coordinator = CreateContactCoordinator(rootViewController: self.rootViewController, contact: nil)
        coordinator.delegate = self
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    func goToContact(contact: Contact) {
        let coordinator = ContactCoordinator(rootViewController: self.rootViewController, contact: contact)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension ContactsListCoordinator: ContactsListViewModelDelegate {
    func contactsListViewModelDidContactTap(contact: Contact) {
        goToContact(contact: contact)
    }
    
    func contactsListViewModelDidTapCreateContact() {
        goToContactCreation()
    }
}

extension ContactsListCoordinator: CreateContactCoordinatorOutput {
    func didFinish(from coordinator: CreateContactCoordinator) {
        removeChildCoordinator(coordinator)
        rootViewController.dismiss(animated: true, completion: nil)
        rootViewController.popToRootViewController(animated: true)
    }
}
