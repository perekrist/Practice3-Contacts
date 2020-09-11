//
//  ContactsListViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

protocol ContactsListViewModelDelegate: class {
    func contactsListViewModelDidTapCreateContact(_ viewModel: ContactsListViewModel)
    func contactsListViewModel(_ viewModel: ContactsListViewModel, didSelectContact contact: Contact)
}

class ContactsListViewModel {
    weak var delegate: ContactsListViewModelDelegate?
    
    private let sectionHeight: CGFloat = 28
    private let sectionCount: Int = 27
    private let collation = UILocalizedIndexedCollation.current()
    private let contactService = ContactsService()
  
    private var contacts: [Contact] = []
    private var filteredContacts: [Contact] = []
    
    init() {
        contacts.sort { $0.name < $1.name }
        contacts = contactService.getContacts()
        filteredContacts = contacts
    }
    
    func search(with query: String) {
        if !query.isEmpty {
            filteredContacts = contacts.filter { (contact: Contact) -> Bool in
                contact.name.contains(query) || contact.surName.contains(query)
            }
        } else {
            reloadData()
        }
    }
    
    func reloadData() {
        filteredContacts = contacts
    }
    
    func sectionTitle(section: Int) -> String? {
        let sectionTitles = collation.sectionTitles as NSArray
        return sectionTitles.object(at: section) as? String
    }
    
    func numberOfSections() -> Int {
        return sectionCount
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return rowContactsCount(sectionName: sectionTitle(section: section) ?? "A")
    }
    
    func sectionIndexTitles() -> [String] {
        return collation.sectionIndexTitles
    }
    
    func heightOfSection(section: Int) -> CGFloat {
        return rowContactsCount(sectionName: sectionTitle(section: section) ?? "A") == 0 ? 0 : sectionHeight
    }
    
    func cellTitle(indexPath: IndexPath) -> NSAttributedString {
        let sectionContacts = filteredContacts.filter { (contact: Contact) -> Bool in
            return contact.surName.starts(with: sectionTitle(section: indexPath.section) ?? "A")
        }
        let contact = sectionContacts[indexPath.row]
        let attrs = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string: contact.name + " ")
        attributedString.append(NSMutableAttributedString(string: contact.surName, attributes: attrs))
        
        return attributedString
    }
    
    func goToContactCreation() {
        delegate?.contactsListViewModelDidTapCreateContact(self)
    }
    
    func goToContactView(indexPath: IndexPath) {
        let sectionContacts = contactService.getContacts().filter { (contact: Contact) -> Bool in
            return contact.surName.starts(with: sectionTitle(section: indexPath.section) ?? "A")
        }
        let contact = sectionContacts[indexPath.row]
        delegate?.contactsListViewModel(self, didSelectContact: contact)
    }
    
    private func rowContactsCount(sectionName: String) -> Int {
        return filteredContacts.filter { (contact: Contact) -> Bool in
            contact.surName.starts(with: sectionName)
        }.count
    }
}
