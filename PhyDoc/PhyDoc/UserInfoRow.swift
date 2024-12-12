//
//  example.swift
//  PhyDoc
//
//  Created by Akberen on 11.12.2024.
//

import SwiftUI

struct UserInfoRow: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.custom("Onest", size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)

            
            Text(value)
                .font(Font.custom("Onest", size: 18))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.customBlack)
                .fontWeight(.semibold)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
    }
}

struct userDetails: View {
    var body: some View {
        VStack(spacing: 24) {
            UserInfoRow(title: "Имя и фамилия", value: "Иванов Иван")
            UserInfoRow(title: "ИИН", value: "041115486195")
            UserInfoRow(title: "Номер телефона", value: "+7 707 748 4815")
            UserInfoRow(title: "Адрес прописки", value: "ул. Гани Иляева 15")
        }
    }
}

#Preview{
    userDetails()
}


struct DetailCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) { // Уменьшенный отступ между текстами
            Text(title.uppercased()) // Верхний текст в верхнем регистре
                .font(.caption)
                .font(Font.custom("Onest", size: 12))
                .foregroundColor(.gray)
            Text(value) // Основное значение
                .font(.headline)
                .font(Font.custom("Onest", size: 24))
                .foregroundColor(.black)
        }
        .frame(width: 100, height: 63) // Размер карточки
        .background(Color.gray.opacity(0.1)) // Фон карточки
        .cornerRadius(12) // Скругленные углы
    }
}

struct InfoRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }
}
