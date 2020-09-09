//
//  ContactCoordinator.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 09.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

protocol ContactCoordinatorOutput: class {
    func didFinish(from coordinator: ContactCoordinator)
}

class ContactCoordinator: Coordinator {
    weak var delegate: ContactCoordinatorOutput?
    
    let rootViewController: UINavigationController
    let contact: Contact
    var viewModel: ContactViewModel
    
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
    
    override func finish() {
        delegate?.didFinish(from: self)
    }
    
    func goToContactEdit() {
        let coordinator = CreateContactCoordinator(rootViewController: self.rootViewController, contact: contact)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension ContactCoordinator: ContactViewModelDelegate {
    func contactViewModelDidEditTap(_ viewModel: ContactViewModel) {
        goToContactEdit()
    }
    
    func contactViewModelDidFinish(_ viewModel: ContactViewModel) {
        finish()
    }
}
