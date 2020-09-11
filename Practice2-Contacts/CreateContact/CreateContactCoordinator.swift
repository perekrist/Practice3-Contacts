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
    func didAllFinish(from coordinator: CreateContactCoordinator)
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
    
    private func goToContact(contact: Contact) {
        let coordinator = ContactCoordinator(rootViewController: self.rootViewController, contact: contact)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    private func close() {
        delegate?.didFinish(from: self)
    }
    
    private func closeAll() {
        delegate?.didAllFinish(from: self)
    }
}

extension CreateContactCoordinator: CreateContactViewModelDelegate {
    func createContactViewModelDidGoToContactsList(_ viewModel: CreateContactViewModel) {
        closeAll()
    }
    
    func createContactViewModelDidContactDone(contact: Contact) {
        goToContact(contact: contact)
    }
    
    func createContactViewModelDidFinish(_ viewModel: CreateContactViewModel) {
        close()
    }
}
