//
//  TagView.swift
//  Friendface
//
//  Created by Mateusz Brychczynski on 04/05/2023.
//

import SwiftUI

struct TagView: View {
    let user: CachedUser
    
    private var tags: [String] {
        user.wrappedTags.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespaces)) }
        }

    var body: some View {
        List(tags, id: \.self) { tag in
            Text(tag)
        }
    
    }
}
//
//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagView(user: User.example)
//    }
//}
