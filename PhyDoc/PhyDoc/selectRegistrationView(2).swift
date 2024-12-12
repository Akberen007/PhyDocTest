//
//  RegistrationView.swift
//  PhyDoc
//
//  Created by Akberen on 12.12.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var selectedOption1 = "Другого"
    @State private var name = ""
    @State private var iin = ""
    @State private var phone = ""
    @State private var address = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                HStack {
                    Spacer()
                    HStack(spacing: 8) {
                        Capsule()
                            .fill(Color.customBlue)
                            .frame(width: 28, height: 8)
                        Capsule()
                            .fill(Color.customBlue)
                            .frame(width: 28, height: 8)
                        Capsule()
                            .fill(Color.customGray)
                            .frame(width: 28, height: 8)
                            .cornerRadius(4)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.gray)
                            .frame(width: 32, height: 32)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)

                Text("Выберите кого хотите записать")
                    .font(Font.custom("Onest", size: 32))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                VStack(spacing: 16) {
                    CustomTextField(title: "Имя и фамилия", text: $name, placeholder: "Иванов Иван")
                    CustomTextField(title: "ИИН", text: $iin, placeholder: "Введите ИИН человека")
                    CustomTextField(title: "Номер телефона", text: $phone, placeholder: "Введите номер телефона")
                    CustomTextField(title: "Адрес", text: $address, placeholder: "Адрес прописки")
                }
                .padding(.horizontal, 24)

                Spacer()

                HStack(spacing: 16) {
                    NavigationLink(destination: SelectPersonView()) {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Назад")
                        }
                        .foregroundColor(Color.black)
                        .font(Font.custom("Onest", size: 16))
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    }
                    .frame(height: 48)

                    Button(action: {}) {
                        Text("Дальше")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(Color.customBlue)
                            .cornerRadius(24)
                    }
                }
                .padding(.horizontal, 24)
            }
            .navigationBarBackButtonHidden(true) 
            .padding(.vertical, 16)
        }
    }
}

struct CustomTextField: View {
    var title: String
    @Binding var text: String
    var placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .font(Font.custom("Onest", size: 16))

            TextField(placeholder, text: $text)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.customLightGray, lineWidth: 1)
                )
        }
    }
}

#Preview {
    RegistrationView()
}
