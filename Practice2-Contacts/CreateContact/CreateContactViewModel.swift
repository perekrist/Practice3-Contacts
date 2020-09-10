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
    
    init(contact: Contact?) {
        self.contact = contact
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
