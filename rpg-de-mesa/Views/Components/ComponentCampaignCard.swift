//
//  ComponentCampaignCard.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 04/08/25.
//
import SwiftUI

struct CampaignCard: View {
    var name: String
    var date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(.headline)
            Text(date)
                .font(.caption)
        }
        .padding()
        .frame(width: 353, height: 90, alignment: .leading)
        .background(Color.blue.opacity(0.3))
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}
