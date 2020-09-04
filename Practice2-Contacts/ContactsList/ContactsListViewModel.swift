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
    
    private let collation = UILocalizedIndexedCollation.current()

    @objc func addContact() {
        print("created")
    }
    
    func numberOfSections() -> Int {
      return 10
    }
    
    func numberOfRowsIn(section: Int) -> Int {
      return section
    }
    
    func sectionIndexTitles() -> [String] {
      return collation.sectionIndexTitles
    }
    
    func heightOfSection(section: Int) -> CGFloat {
        return 28
    }
}
