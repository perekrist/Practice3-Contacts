//
//  ContactsListViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class ContactsListViewModel {
    var contacts: [Contact] = [Contact(name: "Thomas", surName: "Anderson"),
                               Contact(name: "Holden", surName: "Colfield"),
                               Contact(name: "Will", surName: "Baarda"),
                               Contact(name: "Milton", surName: "Aaron"),
                               Contact(name: "Pauline", surName: "Banister"),
                               Contact(name: "Kristina", surName: "Leregudova"),
                               Contact(name: "Holden", surName: "Folfield"),
                               Contact(name: "Will", surName: "Baarda"),
                               Contact(name: "Milton", surName: "Xaron"),
                               Contact(name: "Pauline", surName: "Sanister"),
                               Contact(name: "Kristina", surName: "Peregudova"),
                               Contact(name: "Maxim", surName: "Sachuk")]
    
    private let collation = UILocalizedIndexedCollation.current()
    
    func sectionTitle(section: Int) -> String? {
        let sectionTitles = collation.sectionTitles as NSArray
        return sectionTitles.object(at: section) as? String
    }
    
    func numberOfSections() -> Int {
        return 27
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return rowContactsCount(sectionName: sectionTitle(section: section) ?? "A")
    }
    
    func sectionIndexTitles() -> [String] {
        return collation.sectionIndexTitles
    }
    
    func heightOfSection(section: Int) -> CGFloat {
        let contactsCount = rowContactsCount(sectionName: sectionTitle(section: section) ?? "A")
        if contactsCount == 0 {
            return 0
        } else { return 28 }
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
        var count = 0
        for contact in contacts {
            if contact.surName.starts(with: sectionName) {
                count += 1
            }
        }
        return count
    }
}
