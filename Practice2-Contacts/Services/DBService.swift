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
    
    var contacts: [Contact] = []
    
    func createNewContact(contact: Contact) {
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
    
    func retrieveContacts() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        contacts.removeAll()
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        
        do {
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else { return }
            for data in result {
                guard let contact = data as? ContactDB else { return }
                contacts.append(convertContact(contact: contact))
            }
        } catch {
            print("Failed")
        }
    }
    
    private func convertContact(contact: ContactDB) -> Contact {
        return Contact(name: contact.name ?? "",
                       surName: contact.name ?? "",
                       phone: contact.name ?? "",
                       ringtone: contact.ringtone ?? "",
                       note: contact.note ?? "")
    }
}
