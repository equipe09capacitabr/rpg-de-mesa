//
//  ComponentCampaignSheet.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 13/08/25.
//

import SwiftUI

struct CampaignSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var viewModel: CampaignViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Text("Adicionar Campanha")
                    .font(.headline)
                    .bold()
                
                HStack {
                    Spacer()
                    
                    Button(action: { dismiss() })
                    {
                        Image(systemName: "xmark.circle.fill").font(.title2)
                    }
                }
            }
            .padding(.horizontal, 26)
            .foregroundStyle(.text)
        }
        .padding(.top, 26)
        .padding(.bottom, 47)
        
        TextInput(label: "Nome*", placeholder: "Insira o nome da campanha", text: $viewModel.name, errorMessage: viewModel.errorMessage)
            .padding(.bottom, 20)
        
        TextInput(label: "Descrição", placeholder: "Insira uma descrição", text: $viewModel.description)
        
        Spacer()
        
        CustomButton(label: "Salvar") {
            viewModel.errorMessage = nil
            
             viewModel.createCampaign()
            
            if viewModel.errorMessage == nil {
                dismiss()
            }
        }
    }
}
