//
//  SchedulePicker.swift
//  PhyDoc
//
//  Created by Akberen on 11.12.2024.
//

import SwiftUI

struct SchedulePicker: View {
    @State private var selectedTime: String? = nil // Выбранное время
    @State private var showDetails = false // Флаг для показа дополнительных деталей
    @State private var navigateToConfirm = false // Флаг для перехода на ConfirmEntryView

    private var progressBar: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { _ in
                Capsule()
                    .fill(Color.customBlue)
                    .frame(width: 28, height: 8)
            }
        }
    }

    private var topPanel: some View {
        HStack {
            Spacer()
            progressBar
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
        .padding(.bottom, 16)
    }

    private var warningMessage: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(Color.customOrange)
                .font(.title2)

            VStack(alignment: .leading, spacing: 8) {
                Text("Отмена и изменение времени приема может стоить денег.")
                    .foregroundColor(Color.customBrown)
                    .font(.subheadline)

                Button(action: {
                    showDetails.toggle()
                }) {
                    Text("Подробнее")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.customBrown)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.customBrown, lineWidth: 1)
                        )
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.2))
        .cornerRadius(12)
    }

    private func timeSection(title: String, times: [(String, String)]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal, 24)

            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 12) {
                    ForEach(times.prefix(4), id: \.0) { time, price in
                        timeButton(
                            time: "\(title), \(time)", // Уникальный идентификатор времени
                            displayTime: time,        // Отображаемое время
                            price: price,
                            selectedTime: $selectedTime
                        )
                    }
                }
                if times.count > 4 {
                    HStack(spacing: 12) {
                        ForEach(times.suffix(from: 4), id: \.0) { time, price in
                            timeButton(
                                time: "\(title), \(time)", // Уникальный идентификатор времени
                                displayTime: time,        // Отображаемое время
                                price: price,
                                selectedTime: $selectedTime
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }

    private var navigationButtons: some View {
        HStack(spacing: 16) {
            Button(action: {
                // Логика для кнопки "Назад"
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Назад")
                }
                .foregroundColor(Color.black)
                .font(Font.custom("Onest", size: 16))
                .bold()
                .padding()
                .frame(height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }

            Button(action: {
                if selectedTime != nil {
                    navigateToConfirm = true // Устанавливаем флаг, чтобы инициировать переход
                }
            }) {
                Text("Дальше")
                    .fontWeight(.semibold)
                    .foregroundColor(selectedTime != nil ? .white : .gray)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(selectedTime != nil ? Color.customBlue : Color.gray.opacity(0.2))
                    )
            }
            .disabled(selectedTime == nil)
        }
        .padding(.horizontal, 24)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                topPanel

                Text("Выберите дату и время")
                    .font(Font.custom("Onest", size: 32))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .multilineTextAlignment(.leading)

                warningMessage
                    .padding(.horizontal, 24)

                timeSection(title: "5 мая, пятница", times: [
                    ("11:00", "4000₸"),
                    ("12:30", "3800₸"),
                    ("15:00", "3700₸"),
                    ("16:30", "3500₸")
                ])

                timeSection(title: "8 мая, понедельник", times: [
                    ("9:00", "3500₸"),
                    ("9:30", "3400₸"),
                    ("10:00", "3200₸"),
                    ("10:30", "3100₸"),
                    ("11:00", "3500₸"),
                    ("11:30", "3400₸")
                ])

                Button(action: {}) {
                    Text("Показать еще")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                }
                .padding(.horizontal, 24)

                // Используем NavigationLink для перехода на ConfirmEntryView
                NavigationLink(destination: ConfirmEntryView(), isActive: $navigateToConfirm) {
                    EmptyView()
                }

                navigationButtons
                    .padding(.horizontal, 24)
            }
            .navigationBarBackButtonHidden(true) 
            .padding(.vertical, 16)
        }
    }
}

struct timeButton: View {
    var time: String
    var displayTime: String
    var price: String
    @Binding var selectedTime: String?

    var body: some View {
        Button(action: {
            selectedTime = time
        }) {
            VStack {
                Text(displayTime)
                    .font(.headline)
                    .foregroundColor(selectedTime == time ? .white : .black)
                Text(price)
                    .font(.subheadline)
                    .foregroundColor(selectedTime == time ? .white : .gray)
            }
            .frame(width: 74, height: 64)
            .background(selectedTime == time ? Color.customBlue : Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(selectedTime == time ? Color.customBlue : Color.gray, lineWidth: 1)
            )
        }
    }
}

#Preview {
    SchedulePicker()
}
