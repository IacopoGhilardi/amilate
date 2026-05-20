//
//  AppointmentForm.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 23/03/26.
//

import SwiftUI
import Shared

struct AppointmentForm: View {
    @Environment(\.dismiss) var dismiss

    // Campi base
    @State private var title = ""
    @State private var date = Date()
    @State private var bufferMinutes = 10

    // Destinazione
    @State private var destinationTab = 0
    @State private var selectedDestination: Destination? = nil

    // Geocoding
    @State private var addressQuery = ""
    @State private var saveAsPreferred = false
    @State private var isSearching = false

    private let bufferOptions = [5, 10, 15, 30]

    private var isFormValid: Bool {
        !title.isEmpty && selectedDestination != nil
    }

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            VStack(spacing: 0) {

                // Header
                HStack {
                    Button(action: { dismiss() }) {
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#EDE9FE"))
                                .frame(width: 36, height: 36)
                            Image(systemName: "xmark")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.appSecondary)
                        }
                    }

                    Spacer()

                    Text("Aggiungi appuntamento")
                        .font(.system(size: 11, design: .monospaced))
                        .kerning(2)
                        .textCase(.uppercase)
                        .foregroundColor(.appSecondary)

                    Spacer()

                    Button(action: { }) {
                        ZStack {
                            Circle()
                                .fill(isFormValid ? Color.appPrimary : Color.appBorder)
                                .frame(width: 36, height: 36)
                            Image(systemName: "checkmark")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    .disabled(!isFormValid)
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                .padding(.bottom, 20)

                Divider()
                    .background(Color.appBorder)

                ScrollView {
                    VStack(spacing: 24) {

                        AppTextField(
                            label: "Titolo",
                            placeholder: "Es. Dentista, Riunione...",
                            text: $title
                        )

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Data e ora")
                                .font(.system(size: 11, design: .monospaced))
                                .kerning(1.5)
                                .textCase(.uppercase)
                                .foregroundColor(.appSecondary)

                            DatePicker(
                                "",
                                selection: $date,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                            .tint(.appPrimary)
                            .padding(14)
                            .background(Color.appSurface)
                            .cornerRadius(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.appBorder, lineWidth: 1.5)
                            )
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Anticipo desiderato")
                                .font(.system(size: 11, design: .monospaced))
                                .kerning(1.5)
                                .textCase(.uppercase)
                                .foregroundColor(.appSecondary)

                            HStack(spacing: 8) {
                                ForEach(bufferOptions, id: \.self) { minutes in
                                    Button(action: { bufferMinutes = minutes }) {
                                        Text("\(minutes) min")
                                            .font(.system(size: 13, weight: bufferMinutes == minutes ? .semibold : .regular))
                                            .foregroundColor(bufferMinutes == minutes ? .white : .textSecondary)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 10)
                                            .background(bufferMinutes == minutes ? Color.appPrimary : Color.appSurface)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(bufferMinutes == minutes ? Color.appPrimary : Color.appBorder, lineWidth: 1.5)
                                            )
                                    }
                                }
                            }
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Destinazione")
                                .font(.system(size: 11, design: .monospaced))
                                .kerning(1.5)
                                .textCase(.uppercase)
                                .foregroundColor(.appSecondary)

                            Text("Sezione destinazione")
                                .foregroundColor(.textTertiary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.appSurface)
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.appBorder, lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

#Preview {
    AppointmentForm()
}
