//
//  CampaignViewModel.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 14/08/25.
//

import Foundation

class CampaignViewModel: ObservableObject {
    @Published var campaignsList: [Campaign] = []
    
    init() {
        loadMockdata()
    }
    
    private func loadMockdata() {
        campaignsList = [Campaign(name: "Campanha Teste 01", date:"01/12/2024"),
                         Campaign(name: "Campanha Teste 02", date:"08/02/2025"),
                         Campaign(name: "Campanha Teste 03", date:"24/07/2025"),
                         Campaign(name: "Campanha Teste 04", date: "28/07/2025")]
    }
    
    func getLastCampaign() -> Campaign? {
        return campaignsList.last
    }
}
