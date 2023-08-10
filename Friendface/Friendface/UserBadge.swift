//
//  UserBadge.swift
//  Friendface
//
//  Created by Mateusz Brychczynski on 04/05/2023.
//

import SwiftUI

struct UserBadge: View {
    @Environment(\.colorScheme) var colorScheme
    let user: CachedUser
    
    var personColor: Color {
        if colorScheme == .dark {
            return Color.gray
        } else {
            return Color.black
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(personColor, user.isActive ? .green.opacity(colorScheme == .dark ? 0.75 : 1) : .red.opacity(colorScheme == .dark ? 0.75 : 1))
                    .font(.largeTitle)
                    .imageScale(.large)
                    .fontWeight(.bold)
                Text(user.wrappedName)
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .gray : .black)
            }
        }
    }
}

//struct UserBadge_Previews: PreviewProvider {
//    static var previews: some View {
//        UserBadge(user: User.example)
//    }
//}
