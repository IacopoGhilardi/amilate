//
//  AppointmentDetail.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 22/03/26.
//
import SwiftUI
import Shared

struct AppointmentDetail: View {
    let appointment: Appointment
    var onDelete: () -> Void
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = AppointmentDetailWrapper()

    private var formattedDate: String {
        let calendar = Calendar.current
        let date = appointment.date.asDate
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "it_IT")
        formatter.dateFormat = "d MMMM yyyy"

        if calendar.isDateInToday(date) {
            return "Oggi, \(formatter.string(from: date))"
        } else if calendar.isDateInTomorrow(date) {
            return "Domani, \(formatter.string(from: date))"
        } else {
            return formatter.string(from: date)
        }
    }

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {
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

                        Text("Dettaglio")
                            .font(.system(size: 11, design: .monospaced))
                            .kerning(2)
                            .textCase(.uppercase)
                            .foregroundColor(.appSecondary)

                        Spacer()
                        
                        HStack(spacing: 4) {
                            Button(action: { vm.onDeleteAppointmentTapped() }) {
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: "#FEE2E2"))
                                        .frame(width: 36, height: 36)
                                    Image(systemName: "trash")
                                        .font(.system(size: 14))
                                        .foregroundColor(.appError)
                                }
                            }
                            .alert("Elimina appuntamento", isPresented: Binding(
                                get: { vm.showDeleteConfirmationDialog },
                                set: { if !$0 { vm.showDeleteConfirmationDialog = false } }
                            )) {
                                Button("Elimina", role: .destructive) {
                                    onDelete()
                                    dismiss()
                                }
                                Button("Annulla", role: .cancel) { }
                            } message: {
                                Text("Sei sicuro di voler eliminare questo appuntamento?")
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    .padding(.bottom, 20)

                    AppointmentCard(appointment: appointment, style: .featured)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)

                    VStack(spacing: 10) {
                        infoRow(
                            icon: "calendar",
                            label: "Data",
                            value: formattedDate
                        )

                        infoRow(
                            icon: "mappin.circle.fill",
                            label: "Destinazione",
                            value: appointment.destination.address,
                            hasChevron: true
                        )

                        infoRow(
                            icon: "car.fill",
                            label: "Distanza",
                            value: String(format: "%.1f km", appointment.distanceKm)
                        )
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)

                    Button(action: { openInMaps() }) {
                        HStack(spacing: 8) {
                            Image(systemName: "map.fill")
                            Text("Apri in Maps")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(17)
                        .background(Color.appPrimary)
                        .cornerRadius(16)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                }
            }
        }
    }

    @ViewBuilder
    private func infoRow(icon: String, label: String, value: String, hasChevron: Bool = false) -> some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "#EDE9FE"))
                .frame(width: 36, height: 36)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(.appSecondary)
                )

            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.system(size: 12))
                    .foregroundColor(.textTertiary)
                Text(value)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.textPrimary)
            }

            Spacer()

            if hasChevron {
                Image(systemName: "chevron.right")
                    .font(.system(size: 12))
                    .foregroundColor(.appBorder)
            }
        }
        .padding(14)
        .background(Color.appSurface)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.appBorder, lineWidth: 1.5)
        )
    }

    private func openInMaps() {
        let lat = appointment.destination.latitude
        let lng = appointment.destination.longitude
        let urlString = "https://www.google.com/maps/dir/?api=1&destination=\(lat),\(lng)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    AppointmentDetail(
        appointment: MockData.nextAppointment,
        onDelete: { print("Deleted") }
    )
}
