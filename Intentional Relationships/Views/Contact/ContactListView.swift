//
//  ContactListView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/20/22.
//

import SwiftUI

struct ContactListView: View {
    @ObservedObject var contactListViewModel = ContactListViewModel()
    
    @State var showingAddContact = false
    
    var body: some View {
        
        VStack {
            Text("Hello, World!")
            List{
                ForEach(contactListViewModel.contactViewModels) { contactViewModel in
                    NavigationLink(destination: ContactDetailView(contactViewModel: contactViewModel)) {
                        ContactCell(contactViewModel: contactViewModel)
                    }
                }
            }
            Button(action: { showingAddContact = true }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Add new contact")
                }.sheet(isPresented: $showingAddContact) {
                    AddContactView { contact in
                        contactListViewModel.add(contact)
                        showingAddContact = false
                    }
                }
            }
            .padding()
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
