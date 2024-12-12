//
//  AppointmentConfirmation.swift
//  PhyDoc
//
//  Created by Akberen on 12.12.2024.
//

import SwiftUI

struct AppointmentSuccessView: View {
    var body: some View {
        ZStack {
            Color.customBlue
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("Вы записаны\nна прием!")
                    .font(Font.custom("Onest", size: 32))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                
                Text("Мы отправим вам уведомление чтобы вы не забыли о приеме.\n\nЕсли захотите изменить или отменить запись, вы можете сделать на странице с записями.")
                    .font(Font.custom("Onest", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 24)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Хорошо")
                        .font(Font.custom("Onest", size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.customBlack)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(24)
                        .padding(.horizontal, 24)
                }
            }
            .padding(.top, 100)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    AppointmentSuccessView()
}
