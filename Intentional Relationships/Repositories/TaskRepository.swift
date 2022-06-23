//
//  TaskRepository.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/23/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    // collection of tasks in Firestore

    func loadData() {
        db.collection("tasks").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Task.self)
                        return x
                        //this is possible because of Codable
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    //add snapshot listener that listens to the Task collection.
}
