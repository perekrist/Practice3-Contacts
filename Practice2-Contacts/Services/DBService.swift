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
    
    init() {
        retrieveContacts()
    }
    
    func createNewContact(contact: Contact) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let contactDB2 = ContactDB(context: managedContext)
        contactDB2.id = Int16(contact.id)
        contactDB2.name = contact.name
        contactDB2.surname = contact.surName
        contactDB2.phone = contact.phone
        contactDB2.ringtone = contact.ringtone
        contactDB2.note = contact.note
        contactDB2.image = contact.image?.pngData()
        
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ContactDB")
        
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
    
    func updateContact(contact: Contact) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "ContactDB")
        let predicate = NSPredicate(format: "id = %@", NSNumber(integerLiteral: contact.id))
        fetchRequest.predicate = predicate
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            guard let contactUpdate = test[0] as? ContactDB else { return }
            contactUpdate.name = contact.name
            contactUpdate.surname = contact.surName
            contactUpdate.phone = contact.phone
            contactUpdate.ringtone = contact.ringtone
            contactUpdate.note = contact.note
            contactUpdate.image = contact.image?.pngData()
            
            do {
                try managedContext.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
    func delteContact(contact: Contact) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ContactDB")
        fetchRequest.predicate = NSPredicate(format: "id = %@", NSNumber(integerLiteral: contact.id))
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            guard let contactDelete = test[0] as? NSManagedObject else { return }
            managedContext.delete(contactDelete)
            
            do {
                try managedContext.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
    private func convertContact(contact: ContactDB) -> Contact {
        if contact.image != nil {
            return Contact(id: Int(contact.id),
                           name: contact.name ?? "",
                           surName: contact.surname ?? "",
                           phone: contact.phone,
                           image: UIImage(data: contact.image!),
                           ringtone: contact.ringtone,
                           note: contact.note)
        } else {
            return Contact(id: Int(contact.id),
                           name: contact.name ?? "",
                           surName: contact.surname ?? "",
                           phone: contact.phone,
                           ringtone: contact.ringtone,
                           note: contact.note)
        }
    }
}
