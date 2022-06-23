//
//  AddContactView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/20/22.
//

import SwiftUI

struct AddContactView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var birthday: String = ""
    @State private var groupTag: String = ""
    @State private var groupColor: String = ""
    @State private var greatTraits: String = ""
    @State private var memories: String = ""
    @State private var takeaways: String = ""
    
    //need to let Firestore know that we have a new card
    //callback flag:
    
    var didAddContact: (_ contact: Contact) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Birthday", text: $birthday)
                    TextField("Group", text: $groupTag)
                    TextField("Group Color", text: $groupColor)
                    TextField("Great Traits", text: $greatTraits)
                    TextField("Memories", text: $memories)
                    TextField("Takeaways", text: $takeaways)
                }
            }
        }
    }
}

//struct Contact: Identifiable, Codable {
//    @DocumentID var id: String?
//    var firstName: String
//    var lastName: String
//    var birthday: String
//    var groupTag: String
//    var groupColor: String
//    var greatTraits: [String]? = nil
//    var memories: [String]? = nil
//    var takeaways: [String]? = nil
//}

//struct AddGroupView: View {
//    @State private var name: String = ""
//
//    //need to let Firestore know that we have a new card
//    //callback flag:
//    var didAddGroup: (_ group: Group) -> Void
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Form {
//                    TextField("Group Name", text: $name)
//                }
//
//                Button("Add Group") {
//                    let group = Group(name: name, color: "Blue")
//                    didAddGroup(group)
//                }
//            }
//        }
//    }
//}
