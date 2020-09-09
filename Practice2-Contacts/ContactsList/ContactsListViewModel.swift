//
//  ContactsListViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

protocol ContactsListViewModelDelegate: class {
    func contactsListViewModelDidTapCreateContact()
}

class ContactsListViewModel {
    weak var delegate: ContactsListViewModelDelegate?
    
    private let sectionHeight: CGFloat = 28
    private let sectionCount: Int = 27
    private let collation = UILocalizedIndexedCollation.current()
    private let ringtoneService = ContactsService()
    
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
        let sectionContacts = ringtoneService.getContacts().filter { (contact: Contact) -> Bool in
            return contact.surName.starts(with: sectionTitle(section: indexPath.section) ?? "A")
        }
        let contact = sectionContacts[indexPath.row]
        let attrs = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string: contact.name + " ")
        attributedString.append(NSMutableAttributedString(string: contact.surName, attributes: attrs))
        
        return attributedString
    }
    
    func goToContactCreation() {
        delegate?.contactsListViewModelDidTapCreateContact()
    }
    
    private func rowContactsCount(sectionName: String) -> Int {
        return ringtoneService.getContacts().filter { (contact: Contact) -> Bool in
            contact.surName.starts(with: sectionName)
        }.count
    }
}
