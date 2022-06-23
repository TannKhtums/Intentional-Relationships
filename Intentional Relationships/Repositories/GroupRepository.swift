//
//  GroupRepository.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/30/22.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

final class GroupRepository: ObservableObject {
    private let path = "groups"
    private let db = Firestore.firestore()
    @Published var groups: [Group] = []
    
    init() {
        get()
    }
    
    func get() {
        db.collection(path).addSnapshotListener { (snapshot, error) in
            if let snapshot = snapshot {
                self.groups = snapshot.documents.compactMap { document in
                    do {
                        let groups = try document.data(as: Group.self)
                        return groups
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
    


//The try/catch syntax was added in Swift 2.0 to make exception handling clearer and safer. It's made up of three parts: do starts a block of code that might fail, catch is where execution gets transferred if any errors occur, and any function calls that might fail need to be called using try.

    func add(_ group: Group) {
        do {
            _ = try db.collection(path).addDocument(from: group)
        } catch {
            fatalError("Adding the group failed")
        }
    }

    func remove(_ group: Group) {
        guard let documentId = group.id else { return }
        db.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
            }
        }
    }
        
    func update(_ group: Group) {
        guard let documentId = group.id else { return }
        do {
            try db.collection(path).document(documentId).setData(from: group)
        } catch {
            fatalError("Updating the group failed")
        }
    }

}
