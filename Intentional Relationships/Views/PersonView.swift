//
//  PersonView.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/12/22.
//

import SwiftUI

struct PersonView: View {
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
                    Text("Kathleen Garlick")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                VStack {
                    Text("Dates:")
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                VStack {
                    Text("Admirable Attributes:")
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                VStack {
                    Text("Memories:")
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                VStack {
                    Text("Lessons Learned:")
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

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
