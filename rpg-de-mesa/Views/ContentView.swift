//
//  ContentView.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 03/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CampaignViewModel()
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack(alignment:  .leading, spacing: 16) {
            HStack {
                Text("Minhas Campanhas")
                    .font(.title)
                    .bold()
                Spacer()
                
                Button(action: {
                    showSheet.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 27))
                }
            }
            
            Text("Ultima campanha")
                .font(.headline)
                .padding(.top)
            
            if let lastCampaign = viewModel.getLastCampaign() {
                CampaignCard(name: lastCampaign.name, date: lastCampaign.date)
            }
            
            Text("Todas as campanhas")
                .font(.headline)
                .padding(.top)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.campaignsList) { campaign in
                        CampaignCard(name: campaign.name, date: campaign.date)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .foregroundStyle(.text)
        .background(Color(.background))
        
        .sheet(isPresented: $showSheet) {
            CampaignSheet()
                .presentationBackground(Color(.background))
                .presentationDetents([.height(543)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(30)
        }
    }
}

#Preview {
    ContentView()
}
