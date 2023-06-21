//
//  FileManager-DocumentsDirectory.swift
//  Flashzilla
//
//  Created by Mateusz Brychczynski on 21/06/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
