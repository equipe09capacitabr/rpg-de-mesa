//
//  CampaignViewModel.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 14/08/25.
//

import Foundation
import SwiftUI

final class CampaignViewModel: ObservableObject {
    @Published private(set) var campaigns: [Campaign] = [] {
        didSet { saveToStorage() }
    }
    
    private let storageKey = "savedCampaigns"
    
    init() {
        loadFromStorage()
        //removeCampaign(campaigns.first!)
    }
    
    func addCampaign(name: String, description: String) -> Campaign? {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedName.isEmpty else {
            return nil
        }
        
        let newCampaign = Campaign(name: name, description: description)
        campaigns.append(newCampaign)
        loadFromStorage()
        return newCampaign
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
    
    func getLastCampaign() -> Campaign? {
        return campaigns.last
    }
}
