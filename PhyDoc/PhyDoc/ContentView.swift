//
//  ContentView.swift
//  PhyDoc
//
//  Created by Akberen on 09.12.2024.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            SelectReceptionFormView()
                .navigationDestination(for: String.self) { destination in
                    if destination == "SchedulePicker" {
                        SchedulePicker()
                    } else if destination == "ConfirmEntryView" {
                        ConfirmEntryView()
                    } else if destination == "ConfirmEntry2View" {
                        ConfirmEntry2View()
                    } else if destination == "AppointmentSuccessView" {
                        AppointmentSuccessView()
                    }
                }
        }
    }
}
#Preview{
    ContentView()
}
