//
//  Campaign.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 04/08/25.
//
import Foundation

struct Campaign: Identifiable {
    var id = UUID()
    var name: String
    var date: String
}

var mockCampaigns = [Campaign(name: "Campanha Teste 01", date:"01/12/2024"),
                     Campaign(name: "Campanha Teste 02", date:"08/02/2025"),
                     Campaign(name: "Campanha Teste 03", date:"23/07/2025"),
                     Campaign(name: "Campanha Teste 04", date: "28/07/2025")]
