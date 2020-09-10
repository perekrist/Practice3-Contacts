//
//  CreateContactCoordinator.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 07.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

protocol CreateContactCoordinatorOutput: class {
    func didFinish(from coordinator: CreateContactCoordinator)
}

class CreateContactCoordinator: Coordinator {
    weak var delegate: CreateContactCoordinatorOutput?
    
    private let rootViewController: UINavigationController
    private let contact: Contact?
    private let viewModel: CreateContactViewModel
    
    init(rootViewController: UINavigationController, contact: Contact?) {
        self.rootViewController = rootViewController
        self.contact = contact
        viewModel = CreateContactViewModel(contact: contact)
    }
    
    override func start() {
        viewModel.delegate = self
        let viewController = CreateContactViewController(viewModel: viewModel)
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        delegate?.didFinish(from: self)
    }
    
    func goToContact(contact: Contact) {
        let coordinator = ContactCoordinator(rootViewController: self.rootViewController, contact: contact)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension CreateContactCoordinator: CreateContactViewModelDelegate {
    func createContactViewModelDidContactDone(contact: Contact) {
        goToContact(contact: contact)
    }
    
    func createContactViewModelDidFinish(_ viewModel: CreateContactViewModel) {
        finish()
    }
}
