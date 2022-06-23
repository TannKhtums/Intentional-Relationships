//
//  GroupCell.swift
//  Intentional Relationships
//
//  Created by Tanner Garlick on 5/30/22.
//

import SwiftUI

struct GroupCell: View {
    
    var groupViewModel: GroupCelLViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
            .frame(height: 120)
            .overlay(
                ZStack {
                    HStack {
                        Spacer()
                        Text(groupViewModel.group.name)
                            .foregroundColor(Color.white)
                            .font(.custom("Avenir", size: 24))
                        Spacer()
                    }
                }
            )
            .padding()
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell(groupViewModel: GroupCelLViewModel(group: Group(name: "Family", color: "Blue")))
    }
}
