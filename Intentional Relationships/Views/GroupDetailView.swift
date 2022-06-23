//
//  GroupDetailView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/11/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct GroupDetailView: View {
    
    @State var group: Group
    @State private var contactName: String = ""
    let db = Firestore.firestore()
    
    private func saveContactName() {
        db.collection("groups")
            .document(group.id!)
            .updateData([
                "contactNames": FieldValue.arrayUnion([contactName])
                //arrayUnion means that if there are already values this item will be appended to the array
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    loadContactNames()
                }
            }
    }
    
    private func loadContactNames() {
        let ref = db.collection("groups")
            .document(group.id!)
        
        ref.getDocument { doc, error in
            if let doc = doc, doc.exists {
                if let group = try? doc.data(as: Group.self) {
                    self.group = group
                    self.group.id = doc.documentID
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Contact Name", text: $contactName)
                    .padding()
                Button("Add Contact") {
                    saveContactName()
                }
                
                if let contacts = group.contactNames {
                    List(contacts, id: \.self) { contact in
                        Text(contact)
                    }
                }
                
                Spacer()
            }
        }.navigationTitle(group.name)
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GroupDetailView(group: Group(name: "test", color: "blue"))
    }
}
