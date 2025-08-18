//
//  ContentView.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 03/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CampaignViewModel()
    @State private var selectedCampaign: Campaign? = nil
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment:  .leading, spacing: 16) {
                HStack {
                    Text("Minhas Campanhas")
                        .font(.system(size: 28))
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        showSheet.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 27))
                    }
                }
                
                if viewModel.campaigns.isEmpty {
                    Text("Todas as campanhas")
                        .font(.system(size: 20))
                        .padding(.top)
                        .bold()

                    VStack {
                        Spacer()
                        
                        Text("Você ainda não criou uma campanha.")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.informational)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    
                    Text("Ultima campanha")
                        .font(.system(size: 20))
                        .padding(.top)
                        .bold()
                    
                    if let lastCampaign = viewModel.getLastCampaign() {
                        CampaignCard(campaign: lastCampaign){
                            selectedCampaign = lastCampaign
                        }
                    }
                    
                    Text("Todas as campanhas")
                        .font(.system(size: 20))
                        .padding(.top)
                        .bold()
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(viewModel.campaigns) { campaign in
                                CampaignCard(campaign: campaign){
                                    selectedCampaign = campaign
                                }
                            }
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
            
            .navigationDestination(isPresented: Binding(
                get: { selectedCampaign != nil },
                set: { if !$0 { selectedCampaign = nil }}
            ))
            {
                if selectedCampaign != nil {
                    CampaignView(campaign: selectedCampaign!)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
