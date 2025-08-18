//
//  ComponentCampaignCard.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 04/08/25.
//
import SwiftUI

struct CampaignCard: View {
    let campaign: Campaign
    let onTap: () -> Void
    
    var body: some View {
        Button(action:onTap) {
            VStack(alignment: .leading, spacing: 8) {
                Text(campaign.name)
                    .font(.system(size: 18))
                    .bold()
                
                Text(campaign.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 16))
            }
            .padding()
            .frame(width: 353, height: 90, alignment: .leading)
            .background(Color(.primary))
            .foregroundStyle(.text)
            .cornerRadius(8)
        }
    }
}

#Preview {
    CampaignCard(campaign:
                    Campaign(id: UUID(), name: "Test", description: "", createdAt: Date())){ }
}
