//
//  ValidationError.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 19/08/25.
//

import Foundation

struct ValidationError: LocalizedError, Equatable {
    let message: String
    init(_ message: String) {
        self.message = message
    }
    var errorDescription: String? {
        message
    }
}
