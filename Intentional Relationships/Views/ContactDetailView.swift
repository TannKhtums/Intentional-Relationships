//
//  ContactCell.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 6/14/22.
//

import SwiftUI

struct ContactDetailView: View {
    
    var contactViewModel: ContactCellViewModel
    
    var body: some View {
            ScrollView {
                VStack {
                    HStack {
                        Image("kat")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                            .padding()
        //                    .overlay(Circle().stroke(Color.black, lineWidth: 5))
                        Text("\(contactViewModel.contact.firstName) \(contactViewModel.contact.lastName)")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    VStack {
                        Text("Dates:")
                        Text("\(contactViewModel.contact.birthday)")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    VStack {
                        Text("Admirable Attributes:")
                        if contactViewModel.contact.greatTraits != nil {
                            ForEach(contactViewModel.contact.greatTraits!, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    VStack {
                        Text("Memories:")
                        if contactViewModel.contact.memories != nil {
                            ForEach(contactViewModel.contact.memories!, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    VStack {
                        Text("Lessons Learned:")
                        if contactViewModel.contact.takeaways != nil {
                            ForEach(contactViewModel.contact.takeaways!, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    VStack {
                        Text("Favorite Pictures:")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    
                    Spacer()

                }
            }

        }
    }

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contactViewModel: ContactCellViewModel(contact: Contact(firstName: "Kathleen", lastName: "Garlick", birthday: "10/10/28", groupTag: "Family", groupColor: "Blue", greatTraits: ["Smart", "Sweet", "Kind"], memories: ["Sweetheart Strolls", "Dedicating our home", "Early morning workouts", "Running around Times Square together"], takeaways: ["Teaches me to be more loving and gentle", "Has taught me about what it means to be a cheerleader and to find joy in others' successes. As that's what she does with mine", "Taught me more about the Atonement"])))
    }
}
