//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Mateusz Brychczynski on 18/04/2023.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct FlagImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(name: "Poland")
    }
}
