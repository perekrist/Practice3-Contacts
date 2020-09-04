//
//  ContactsListViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class ContactsListViewModel {
    private let sectionHeight: CGFloat = 28
    private let sectionCount: Int = 27
    private let collation = UILocalizedIndexedCollation.current()
    
    private var contacts: [Contact] = [Contact(name: "Thomas", surName: "Anderson"),
                               Contact(name: "Holden", surName: "Colfield"),
                               Contact(name: "Abill", surName: "Baarda"),
                               Contact(name: "Milton", surName: "Aaron"),
                               Contact(name: "Pauline", surName: "Banister"),
                               Contact(name: "Kristina", surName: "Leregudova"),
                               Contact(name: "Holden", surName: "Folfield"),
                               Contact(name: "Brill", surName: "Baarda"),
                               Contact(name: "Milton", surName: "Xaron"),
                               Contact(name: "Pauline", surName: "Sanister"),
                               Contact(name: "Kristina", surName: "Peregudova"),
                               Contact(name: "Maxim", surName: "Sachuk")]
    
    init() {
        contacts.sort { $0.name < $1.name }
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
        let sectionContacts = contacts.filter { (contact: Contact) -> Bool in
            return contact.surName.starts(with: sectionTitle(section: indexPath.section) ?? "A")
        }
        let contact = sectionContacts[indexPath.row]
        let attrs = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string: contact.name + " ")
        attributedString.append(NSMutableAttributedString(string: contact.surName, attributes: attrs))
        
        return attributedString
    }
    
    private func rowContactsCount(sectionName: String) -> Int {
        return contacts.filter { (contact: Contact) -> Bool in
            contact.surName.starts(with: sectionName)
        }.count
    }
}
