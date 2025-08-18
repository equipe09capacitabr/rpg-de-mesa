//
//  Campaign.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 04/08/25.
//
import Foundation

struct Campaign: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String?
    var createdAt: Date = Date()
}

