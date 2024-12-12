//
//  API.swift
//  PhyDoc
//
//  Created by Akberen on 12.12.2024.
//

import SwiftUI

// Структура, которая будет хранить данные о времени приема
struct Schedule: Codable {
    var time: String
    var price: String
}

class ScheduleViewModel: ObservableObject {
    @Published var schedule: [Schedule] = []
    
    func fetchSchedule() {
        guard let url = URL(string: "https://phydoc-test-2d45590c9688.herokuapp.com/api/schedule") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching schedule: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let scheduleData = try decoder.decode([Schedule].self, from: data)
                DispatchQueue.main.async {
                    self.schedule = scheduleData
                }
            } catch {
                print("Error decoding schedule data: \(error)")
            }
        }.resume()
    }
}

struct SchedulePickerView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    
    var body: some View {
        VStack {
            // Показываем расписание
            List(viewModel.schedule, id: \.time) { schedule in
                Text("\(schedule.time) - \(schedule.price)")
            }
        }
        .onAppear {
            viewModel.fetchSchedule()
        }
    }
}

#Preview {
    SchedulePickerView()
}
