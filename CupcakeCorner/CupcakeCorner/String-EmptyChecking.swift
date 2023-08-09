//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Mateusz Brychczynski on 28/04/2023.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
