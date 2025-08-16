//
//  ComponentTextInput.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 13/08/25.
//

import SwiftUI

struct TextInput: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack (alignment: .leading){
            Text(label)
                .font(.headline)
                .foregroundStyle(.text)
                .padding(.bottom, -4)
            
            TextField(placeholder, text: $text)
                .padding(.horizontal, 14)
                .frame(width: 353, height: 58)
                .background(Color.backgroundSecondary)
                .cornerRadius(12)
                .font(.system(size: 16))
        }
    }
}

#Preview {
    @Previewable @State var nome = ""
    
    TextInput(label: "Nome", placeholder: "Insira o nome", text: $nome)
}
