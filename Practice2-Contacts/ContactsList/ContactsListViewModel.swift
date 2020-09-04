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
    
    func sectionTitle(section: Int) -> String? {
        let sectionTitles = collation.sectionTitles as NSArray
        return sectionTitles.object(at: section) as? String
    }
    
    func numberOfSections() -> Int {
      return 27
    }
    
    func numberOfRowsIn(section: Int) -> Int {
      return 2
    }
    
    func sectionIndexTitles() -> [String] {
      return collation.sectionIndexTitles
    }
    
    func heightOfSection(section: Int) -> CGFloat {
        return 28
    }
}
