//
//  DBService.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 10.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBService {
    func saveNewContact(contact: Contact) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let contactEntity = NSEntityDescription.entity(forEntityName: "Contact", in: managedContext)!
        let contactDB = NSManagedObject(entity: contactEntity, insertInto: managedContext)
        
        contactDB.setValue(contact.name, forKey: "name")
        contactDB.setValue(contact.surName, forKey: "surname")
        contactDB.setValue(contact.phone, forKey: "phone")
        contactDB.setValue(contact.ringtone, forKey: "ringtone")
        contactDB.setValue(contact.note, forKey: "note")
        contactDB.setValue(contact.image, forKey: "image")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
