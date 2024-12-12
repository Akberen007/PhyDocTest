import SwiftUI

struct ConfirmEntry2View: View {
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

                // Заголовок
                Text("Подтвердите запись")
                    .font(Font.custom("Onest", size: 32))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

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
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.gray)
                            Text("4.9")
                                .font(Font.custom("Onest", size: 16))
                                .foregroundStyle(.gray)
                            Text("• Шымкент")
                                .font(Font.custom("Onest", size: 16))
                                .foregroundColor(.gray)
                        }
                        .font(.footnote)
                    }

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "ellipsis.message")
                            .foregroundColor(Color.black)
                            .padding(12)
                            .background(
                                Circle()
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
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
                                .font(.subheadline)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Пациент:")
                                .font(Font.custom("Onest", size: 16))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Иванов Иван")
                                .font(Font.custom("Onest", size: 18))
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)

                // Информация об оплате
                HStack {
                    HStack(spacing: 12) {
                        Image("Visa")
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

                // Кнопки
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

                    // Добавляем NavigationLink для перехода
                    NavigationLink(destination: AppointmentSuccessView()) {
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
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    ConfirmEntry2View()
}
