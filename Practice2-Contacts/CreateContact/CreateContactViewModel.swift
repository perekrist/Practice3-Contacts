//
//  CreateContactViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 07.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import UIKit

protocol CreateContactViewModelDelegate: class {
    func createContactViewModelDidFinish(_ viewModel: CreateContactViewModel)
    func createContactViewModelDidContactDone(contact: Contact)
}

class CreateContactViewModel {
    weak var delegate: CreateContactViewModelDelegate?
    var contact: Contact?
    private let dbService = DBService()
    
    init(contact: Contact?) {
        self.contact = contact
    }
    
    func createContact() {
        guard let contact = contact else { return }
        dbService.createNewContact(contact: contact)
        dbService.retrieveContacts()
    }
    
    func updateContact() {
        guard let contact = contact else { return }
        dbService.updateContact(contact: contact)
        dbService.retrieveContacts()
    }
    
    func deleteContact() {
        guard let contact = contact else { return }
        dbService.delteContact(contact: contact)
        dbService.retrieveContacts()
    }
    
    func verifyContact(contact: Contact) -> Bool {
        if contact.name.isEmpty {
            return false
        }
        return true
    }
    
    func goBack() {
        delegate?.createContactViewModelDidFinish(self)
    }
    
    func goToContact() {
        delegate?.createContactViewModelDidContactDone(contact: contact!)
    }
}
