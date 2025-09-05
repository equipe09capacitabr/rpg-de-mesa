//
//  CampaignViewModel.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 14/08/25.
//

import Foundation
import SwiftUI

@Observable
final class CampaignViewModel {
    private let validator = CampaignValidator()
    var name: String = ""
    var description: String = ""
    
    private(set) var campaigns: [Campaign] = [] {
        didSet { saveToStorage() }
    }
    
    var errorMessage: String?
    private let storageKey = "savedCampaigns"
    
    init() {
        loadFromStorage()
    }
    
    func getLastCampaign() -> Campaign? {
        return campaigns.last
    }
    
    func createCampaign() {
        do {
            try validator.validate(name: name)
            
            let campaign = Campaign(name: name, description: description)
            campaigns.append(campaign)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func removeCampaign(_ campaign: Campaign) {
        campaigns.removeAll { $0.id == campaign.id }
    }
    
    private func saveToStorage() {
        if let encoded = try? JSONEncoder().encode(campaigns) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    private func loadFromStorage() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let savedCampaigns = try? JSONDecoder().decode([Campaign].self, from: data) else {
            return
        }
        campaigns = savedCampaigns
    }
}
