//
//  ContactsListViewModel.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class ContactsListViewModel {
    var onDidUpdate: (() -> Void)?
    var onDidError: ((Error) -> Void)?
}
