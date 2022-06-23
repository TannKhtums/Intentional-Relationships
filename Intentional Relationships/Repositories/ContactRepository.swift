//
//  ContactRepository.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/14/22.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ContactRepository: ObservableObject {
    private let path = "contacts"
    private let db = Firestore.firestore()
    @Published var contacts: [Contact] = []
    
    init() {
        get()
    }
    
    func get() {
        db.collection(path).addSnapshotListener { (snapshot, error) in
            if let snapshot = snapshot {
                self.contacts = snapshot.documents.compactMap { document in
                    do {
                        let contacts = try document.data(as: Contact.self)
                        return contacts
                    }
                    catch {
                        print(error)
                    }
                    return nil
                    // or return nil? Does this matter?
                }
            }
        }
    }

    func add(_ contact: Contact) {
        do {
            _ = try db.collection(path).addDocument(from: contact)
        } catch {
            fatalError("Adding the contact failed")
        }
    }

    func remove(_ contact: Contact) {
        guard let documentId = contact.id else { return }
        db.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
            }
        }
    }
        
    func update(_ contact: Contact) {
        guard let documentId = contact.id else { return }
        do {
            try db.collection(path).document(documentId).setData(from: contact)
        } catch {
            fatalError("Updating the group failed")
        }
    }
}
