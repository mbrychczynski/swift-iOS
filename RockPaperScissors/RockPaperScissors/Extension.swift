//
//  Extension.swift
//  RockPaperScissors
//
//  Created by Mateusz Brychczynski on 19/04/2023.
//

import Foundation
import SwiftUI

struct EmojiStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 80))
            .frame(width: 100, height: 100)
            .padding(.horizontal, 5)
            .background(.ultraThinMaterial)
            .clipShape(Circle())
    }
}


extension View {
    func emojiStyle() -> some View {
        modifier(EmojiStyle())
    }
}
