//
//  ContentView.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 03/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment:  .leading, spacing: 16) {
            HStack {
                Text("Minhas Campanhas")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                
                Button(action: {
                    print(">>>")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .frame(width: 32, height: 32)
                }
            }
            
            Text("Ultima campanha")
                .font(.headline)
                .padding(.top)
            
            if let lastCampaign = mockCampaigns.last {
                CampaignCard(name: lastCampaign.name, date: lastCampaign.date)
            }
            
            Text("Todas as campanhas")
                .font(.headline)
                .padding(.top)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(mockCampaigns) { campaign in
                        CampaignCard(name: campaign.name, date: campaign.date)
                    }
                }
            }
        }.padding(20)
    }
}
#Preview {
    ContentView()
}
