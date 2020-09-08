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
    
    let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let viewModel = CreateContactViewModel()
        let viewController = CreateContactViewController(viewModel: viewModel)
        rootViewController.setViewControllers([viewController], animated: false)
    }
    
    override func finish() {
        delegate?.didFinish(from: self)
    }
}

extension CreateContactCoordinator: CreateContactViewModelDelegate {
    func createContactViewModelDidFinish(_ viewModel: CreateContactViewModel) {
        finish()
    }
}
