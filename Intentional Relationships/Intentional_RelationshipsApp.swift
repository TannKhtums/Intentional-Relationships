//
//  Intentional_RelationshipsApp.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/12/22.
//

import SwiftUI
import Firebase

@main
struct Intentional_RelationshipsApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
