//
//  CampaignView.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 17/08/25.
//

import SwiftUI

struct CampaignView: View {
    @State var campaign: Campaign
    @State private var selectedSegment = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(campaign.name)
                    .font(.system(size: 28))
                    .bold()
                
                Spacer()
            }
            
            if campaign.description == nil {
                Text("Sem descrição.")
                    .font(.system(size: 16))
            } else {
                Text(campaign.description!)
                    .font(.subheadline)
                    .bold()
            }
            
            Picker("Selecione", selection: $selectedSegment) {
                Text("Personagem").tag(1)
                Text("Itens").tag(2)
                Text("inimigos").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Group {
                switch selectedSegment {
                case 1:
                    VStack {
                        Spacer()
                        
                        Text("Você ainda não criou seu personagem.")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.informational)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                case 2:
                    VStack {
                        Spacer()
                        
                        Text("Você ainda não criou um item.")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.informational)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                case 3:
                    VStack {
                        Spacer()
                        
                        Text("Você ainda não criou um inimigo.")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.informational)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                default:
                    EmptyView()
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .foregroundStyle(.text)
        .background(Color(.background))
    }
}

#Preview {
    CampaignView(campaign: Campaign(id: UUID(), name: "Test", description: nil, createdAt: Date()))
}
