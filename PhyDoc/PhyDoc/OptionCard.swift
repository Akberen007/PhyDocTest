//
//  OptionCard.swift
//  PhyDoc
//
//  Created by Akberen on 11.12.2024.
//
import SwiftUI

struct OptionCard: View {
    let title: String
    let description: String
    let isSelected: Bool
    let onSelect: () -> Void

    var body: some View {
        Button(action: onSelect) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.customBlue.opacity(0.1) : Color.gray.opacity(0.1))
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.customBlue : Color.clear, lineWidth: 2)
                    )
                    .frame(width: 320, height: 116, alignment: .leading)

                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(Font.custom("Onest", size: 18))
                        .foregroundColor(isSelected ? Color.customBlue : Color.black)

                    Text(description)
                        .font(Font.custom("Onest", size: 14))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                }
                .padding(16)
            }
            .frame(height: 100)
        }
    }
}





