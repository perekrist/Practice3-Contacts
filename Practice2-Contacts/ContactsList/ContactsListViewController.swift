//
//  ContactsListViewController.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit
import SnapKit

class ContactsListViewController: UITableViewController {
    private let viewModel: ContactsListViewModel
    
    private lazy var searchController = UISearchController(searchResultsController: nil)
    
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
        view.backgroundColor = #colorLiteral(red: 0.9249437451, green: 0.9250733852, blue: 0.9249027371, alpha: 1)
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
        navigationItem.backBarButtonItem?.tintColor = UIColor.systemBlue
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.addButton(),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addContact))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
    }
    
    @objc func addContact() {
        viewModel.goToContactCreation()
    }
    
}

extension ContactsListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        guard !text.isEmpty else { return }
    }
}

extension ContactsListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionTitle(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: .zero)
        cell.textLabel?.attributedText = viewModel.cellTitle(indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightOfSection(section: section)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.sectionIndexTitles()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToContactView(indexPath: indexPath)
    }
}
