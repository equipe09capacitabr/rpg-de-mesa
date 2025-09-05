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
    let onDelete: () -> Void
    @State private var showDeleteConfirmation = false
    @State private var viewModel = CampaignViewModel()
    
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
        .contextMenu {
            Button(action: {  }) {
                Label("Editar", systemImage: "pencil")
            }
            
            Button(role: .destructive)
            {
                showDeleteConfirmation = true
            } label: {
                Label("Excluir", systemImage: "trash")
            }
        }
        .confirmationDialog("Tem certeza que deseja excluir esta campanha?", isPresented: $showDeleteConfirmation, titleVisibility: .visible) {
            Button("Excluir", role: .destructive) {
                viewModel.removeCampaign(campaign)
            }
            
            Button("Cancelar", role: .cancel) {  }
        }
    }
}
