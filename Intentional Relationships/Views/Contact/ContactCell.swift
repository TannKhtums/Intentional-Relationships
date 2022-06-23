//
//  ContactCell.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/20/22.
//

import SwiftUI

struct ContactCell: View {
    var contactViewModel: ContactCellViewModel
    
    var body: some View {
        HStack {
            Image("kat")
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .shadow(radius: 3)
                .padding()
            Text("\(contactViewModel.contact.firstName) \(contactViewModel.contact.lastName)")
                .font(.title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contactViewModel: ContactCellViewModel(contact: Contact(firstName: "Kathleen", lastName: "Garlick", birthday: "Oct 28, 1991", groupTag: "Wifey", groupColor: "Blue")))
    }
}
