//
//  DailyToDo.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
//    @DocumentID var id: String = UUID().uuidString
    //DocumentID tells Firebase Codable support: whenever reading anything from Firestore and if there is an id on the struct, take that ID and map it here
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}


#if DEBUG
//
//TEST DATA

let testDataTasks = [
    Task(title: "Implement UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "Add Firebase Authentication", completed: false),
    Task(title: "Yay, the first piece of the app is done", completed: false)
]

#endif
