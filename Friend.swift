//
//  Friend.swift
//  SwiftData
//
//  Created by Tiger on 7/25/25.
//

import Foundation

class Friend: Codable {
    var name: String
    var bday: Date
    
    init(name: String, bday: Date) {
        self.name = name
        self.bday = bday
    }
}

