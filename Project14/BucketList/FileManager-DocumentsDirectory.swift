//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Peyton Gasink on 11/29/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
