//
//  SelectReceptionFormView.swift
//  PhyDoc
//
//  Created by Akberen on 12.12.2024.
//

import SwiftUI

struct SelectReceptionFormView: View {
    @State private var selectedOption: String? = nil

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
                            .fill(Color.customBlue.opacity(0.2))
                            .frame(width: 28, height: 6)
                        Capsule()
                            .fill(Color.customBlue.opacity(0.2))
                            .frame(width: 28, height: 6)
                            .cornerRadius(8)
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

                Text("Выберите формат приема")
                    .font(Font.custom("Onest", size: 32))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, -20)
                    .padding(.horizontal, 20)

                VStack(spacing: 16) {
                    OptionCard(
                        title: "Онлайн-консультация",
                        description: "Врач созвонится с вами и проведет консультацию в приложении.",
                        isSelected: selectedOption == "Онлайн-консультация",
                        onSelect: {
                            selectedOption = "Онлайн-консультация"
                        }
                    )
                    OptionCard(
                        title: "Записаться в клинику",
                        description: "Врач будет ждать вас в своем кабинете в клинике.",
                        isSelected: selectedOption == "Записаться в клинику",
                        onSelect: {
                            selectedOption = "Записаться в клинику"
                        }
                    )
                    OptionCard(
                        title: "Вызвать на дом",
                        description: "Врач сам приедет к вам домой в указанное время и дату.",
                        isSelected: selectedOption == "Вызвать на дом",
                        onSelect: {
                            selectedOption = "Вызвать на дом"
                        }
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)

                Spacer()

                HStack(spacing: 16) {
                    Button(action: {
                        print("Back action triggered")
                    }) {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Назад")
                        }
                        .foregroundColor(Color.black)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    }
                    .frame(height: 48)

                    NavigationLink(destination: SelectPersonView().navigationBarBackButtonHidden(true)) {
                        Text("Дальше")
                            .fontWeight(.bold)
                            .foregroundColor(selectedOption != nil ? Color.white : Color.gray)
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(selectedOption != nil ? Color.customBlue : Color.gray.opacity(0.2))
                            )
                    }
                    .disabled(selectedOption == nil)
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
            }
            .padding(.top, 16)
            .padding(.bottom, 5)
            .background(Color(UIColor.systemBackground))
            .navigationBarBackButtonHidden(true) 
        }
    }
}

#Preview {
    SelectReceptionFormView()
}
