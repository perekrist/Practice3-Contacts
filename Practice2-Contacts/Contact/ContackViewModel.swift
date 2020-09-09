//
//  ContackViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 09.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

protocol ContactViewModelDelegate: class {
    func contactViewModelDidFinish(_ viewModel: ContactViewModel)
    func contactViewModelDidEditTap(_ viewModel: ContactViewModel)
}

class ContactViewModel {
    weak var delegate: ContactViewModelDelegate?
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func goBack() {
        delegate?.contactViewModelDidFinish(self)
    }
    
    func goToContactEdit() {
        delegate?.contactViewModelDidEditTap(self)
    }
}
