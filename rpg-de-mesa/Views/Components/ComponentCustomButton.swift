//
//  ComponentButton.swift
//  rpg-de-mesa
//
//  Created by iredefbmac_25 on 14/08/25.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .foregroundStyle(.white)
        }
        .frame(width: 353, height: 58)
        .background(Color(.action))
        .cornerRadius(12)
        .padding(20)
    }
}

#Preview {
    CustomButton(label: "Hello, World!", action: {})
}
