//
//  ContactCoordinator.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 09.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

protocol ContactCoordinatorDelegate: class {
    func сontactCoordinatorDidFinish(_ coordinator: ContactCoordinator)
}

class ContactCoordinator: Coordinator {
    weak var delegate: ContactCoordinatorDelegate?
    
    private let rootViewController: UINavigationController
    private let contact: Contact
    private var viewModel: ContactViewModel
    
    init(rootViewController: UINavigationController, contact: Contact) {
        self.rootViewController = rootViewController
        self.contact = contact
        viewModel = ContactViewModel(contact: contact)
    }
    
    override func start() {
        viewModel.delegate = self
        let viewController = ContactViewController(viewModel: viewModel)
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    private func close() {
        delegate?.сontactCoordinatorDidFinish(self)
    }
    
    func goToContactEdit() {
        let coordinator = CreateContactCoordinator(rootViewController: self.rootViewController, contact: contact)
        coordinator.delegate = self
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension ContactCoordinator: ContactViewModelDelegate {
    func contactViewModelDidEditTap(_ viewModel: ContactViewModel) {
        goToContactEdit()
    }
    
    func contactViewModelDidFinish(_ viewModel: ContactViewModel) {
        close()
    }
}

extension ContactCoordinator: CreateContactCoordinatorOutput {
    func didFinish(from coordinator: CreateContactCoordinator) {
        removeChildCoordinator(coordinator)
        rootViewController.popViewController(animated: true)
    }
}
