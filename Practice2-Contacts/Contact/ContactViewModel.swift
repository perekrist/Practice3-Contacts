//
//  ContactsListViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class ContactViewModel {
    var contact = Contact(name: "Thomas", surName: "Anderson", phone: "89131131314", ringtone: "Duck", note: "This is a note")
    
    var onDidUpdate: (() -> Void)?
    var onDidError: ((Error) -> Void)?
}
