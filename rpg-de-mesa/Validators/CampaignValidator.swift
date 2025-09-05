//
//  CampaignValidator.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 19/08/25.
//

class CampaignValidator {
    func validate(name: String) throws {
        guard !name.isEmpty else {
            throw ValidationError("O nome da campanha é obrigatório.")
        }
    }
}
