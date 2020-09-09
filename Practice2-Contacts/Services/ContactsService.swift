//
//  RingtoneService.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 09.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

class ContactsService {
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
    
    func getContacts() -> [Contact] {
        return contacts
    }
    
    func addContact(contact: Contact) {
        self.contacts.append(contact)
    }
}
