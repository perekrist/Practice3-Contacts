//
//  ContactsListViewController.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit
import SnapKit

class ContactsListViewController: UIViewController {
    private let viewModel: ContactsListViewModel
    
    init(viewModel: ContactsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

extension ContactsListViewController {
    func initialSetup() {
        view.backgroundColor = .lightGray
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = R.string.contactsList.navBarTitle()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: R.string.contact.bacButtonTitle(),
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.addButton(),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addContact))
    }
    
    @objc private func addContact() {
        print("created")
    }
    
}

extension ContactsListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        guard !text.isEmpty else { return }
        
        print(text)
    }
}
