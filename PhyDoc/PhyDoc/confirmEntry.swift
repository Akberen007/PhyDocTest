import SwiftUI

struct ConfirmEntryView: View {
    @State private var navigateToNextScreen = false // Флаг для перехода на ConfirmEntry2View
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Верхняя часть с прогресс-баром
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
                            .fill(Color.customBlue)
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

                // Заголовок
                Text("Подтвердите запись")
                    .font(Font.custom("Onest", size: 32))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                // Вставка warningMessage
                warningMessage
                    .padding(.horizontal, 24) // Обязательно добавьте отступы, если нужно

                // Информация о враче
                HStack(spacing: 16) {
                    Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Оксана Михайловна")
                            .font(Font.custom("Onest", size: 16))
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Офтальмолог")
                            .font(Font.custom("Onest", size: 16))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "ellipsis.message")
                            .foregroundColor(Color.black) // Цвет иконки
                            .padding(12) // Отступы внутри кнопки
                            .background(
                                Circle()
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1) // Серая обводка
                            )
                    }
                }
                .padding(.horizontal, 24)

                // Информация о времени, дате и цене
                HStack(spacing: 16) {
                    DetailCard(title: "ВРЕМЯ", value: "15:00")
                    DetailCard(title: "ДАТА", value: "5 мая")
                    DetailCard(title: "ЦЕНА", value: "1500₸")
                }
                .padding(.horizontal, 24)

                // Информация о формате приема и пациенте
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Формат приема:")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .font(Font.custom("Onest", size: 16))
                            Text("Онлайн-консультация")
                                .font(Font.custom("Onest", size: 18))
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Пациент:")
                                .font(Font.custom("Onest", size: 16))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Иванов Иван")
                                .font(Font.custom("Onest", size: 18))
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)

                // Информация об оплате
                HStack {
                    HStack(spacing: 12) {
                        Image("Visa") // Логотип карты
                            .resizable()
                            .frame(width: 35, height: 24)
                        VStack(alignment: .leading) {
                            Text("•••• 4515")
                                .bold()
                            Text("03/24")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .font(Font.custom("Onest", size: 14))
                        }
                    }
                    Spacer()
                    Text("4500₸")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                        .frame(width: 24, height: 24)

                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                .padding(.horizontal, 24)

                // Навигационные кнопки
                HStack(spacing: 16) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "arrow.left")
                        }
                        .foregroundColor(Color.black)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.customLightGray, lineWidth: 2)
                        )
                    }
                    .frame(height: 48)

                    // NavigationLink для перехода на ConfirmEntry2View
                    NavigationLink(destination: ConfirmEntry2View(), isActive: $navigateToNextScreen) {
                        EmptyView()
                    }

                    Button(action: {
                        // Переход на следующий экран
                        navigateToNextScreen = true
                    }) {
                        Text("Подтвердить и оплатить")
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
    
    // Обновленный warningMessage
    private var warningMessage: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(Color.customOrange)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Отмена и изменение времени приема может стоить денег.")
                    .foregroundColor(Color.customBrown)
                    .font(.subheadline)
                
                Button(action: {}) {
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
}

#Preview {
    ConfirmEntryView()
}
