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
    func createContactViewModel(_ viewModel: CreateContactViewModel, didSaveContact contact: Contact)
}

class CreateContactViewModel {
    weak var delegate: CreateContactViewModelDelegate?
    var contact: Contact?
    
    var ringtones: [String] = ["Default", "Duck", "Bark", "Piano", "Guitar"]
    var onDidError: ((String) -> Void)?
    
    init(contact: Contact?) {
        self.contact = contact
    }
    
    func saveContact(name: String,
                     surName: String,
                     phone: String?,
                     image: UIImage?,
                     ringtone: String?,
                     note: String?) {
        let contact = Contact(name: name, surName: surName, phone: phone, image: image, ringtone: ringtone, note: note)
        if !verifyContact(contact: contact) {
            onDidError?(R.string.createContact.emptyFieldsError())
        } else {
            self.contact = contact
            goToContact()
        }
    }
    
    func goBack() {
        delegate?.createContactViewModelDidFinish(self)
    }
    
    func goToContact() {
        delegate?.createContactViewModel(self, didSaveContact: contact!)
    }
    
    private func verifyContact(contact: Contact) -> Bool {
        if contact.name.isEmpty {
            return false
        }
        return true
    }
}
