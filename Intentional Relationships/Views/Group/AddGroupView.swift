//
//  AddGroupView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/30/22.
//

import SwiftUI

struct AddGroupView: View {
    @State private var name: String = ""
    
    //need to let Firestore know that we have a new card
    //callback flag:
    var didAddGroup: (_ group: Group) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Group Name", text: $name)
                }
                
                Button("Add Group") {
                    let group = Group(name: name, color: "Blue")
                    didAddGroup(group)
                }
            }
        }
    }
}
