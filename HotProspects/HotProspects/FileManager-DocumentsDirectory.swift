//
//  FileManager-DocumentsDirectory.swift
//  HotProspects
//
//  Created by Mateusz Brychczynski on 20/06/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
