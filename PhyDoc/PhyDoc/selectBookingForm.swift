//
//  SelectPersonView.swift
//  PhyDoc
//
//  Created by Akberen on 11.12.2024.
//

import SwiftUI

struct SelectPersonView: View {
    @State private var selectedOption: String = "Себя"
    @State private var navigateToSchedulePicker = false

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
                            .fill(Color.customBlue.opacity(0.2))
                            .frame(width: 28, height: 6)
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

                Text("Выберите кого\nхотите записать")
                    .font(Font.custom("Onest", size: 32))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                HStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.customLightGray, lineWidth: 1)
                            .frame(width: 320, height: 58)

                        HStack(spacing: 0) {
                            Button(action: {
                                selectedOption = "Себя"
                            }) {
                                Text("Себя")
                                    .fontWeight(.bold)
                                    .foregroundColor(selectedOption == "Себя" ? .white : .black)
                                    .frame(width: 160, height: 58)
                                    .background(selectedOption == "Себя" ? Color.customBlue : Color.white)
                                    .cornerRadius(12)
                            }

                            Button(action: {
                                selectedOption = "Другого"
                            }) {
                                Text("Другого")
                                    .fontWeight(.bold)
                                    .foregroundColor(selectedOption == "Другого" ? .white : .black)
                                    .frame(width: 160, height: 58)
                                    .background(selectedOption == "Другого" ? Color.customBlue : Color.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                }

                if selectedOption == "Себя" {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Имя и фамилия")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Иванов Иван")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("ИИН")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("041115486195")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Номер телефона")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("+7 707 748 4815")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Адрес прописки")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("ул. Гани Ильяева 15")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal, 24)
                } else if selectedOption == "Другого" {
                    VStack(spacing: 16) {
                        CustomTextField(title: "Имя и фамилия", text: .constant(""), placeholder: "Введите имя и фамилию")
                        CustomTextField(title: "ИИН", text: .constant(""), placeholder: "Введите ИИН человека")
                        CustomTextField(title: "Номер телефона", text: .constant(""), placeholder: "Введите номер телефона")
                        CustomTextField(title: "Адрес", text: .constant(""), placeholder: "Адрес прописки")
                    }
                    .padding(.horizontal, 24)
                }

                Spacer()

                NavigationLink(destination: SchedulePicker(), isActive: $navigateToSchedulePicker) {
                    EmptyView()
                }

                Button(action: {
                    navigateToSchedulePicker = true
                }) {
                    Text("Дальше")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.customBlue)
                        .cornerRadius(24)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
            .padding(.top, 16)
            .background(Color(UIColor.systemBackground))
            .navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    SelectPersonView()
}
