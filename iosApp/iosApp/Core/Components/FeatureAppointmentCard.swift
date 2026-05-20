//
//  FeatureAppointmentCard.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 22/03/26.
//
import SwiftUI
import Shared

struct FeatureAppointmentCard: View {
    let appointment: Appointment

    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: appointment.date.asDate)
    }

    private var formattedDeparture: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: appointment.departureTime.asDate)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: [Color(hex: "#4F46E5"), Color(hex: "#6D28D9")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 130, height: 130)
                .offset(x: 80, y: -50)

            Circle()
                .fill(Color.white.opacity(0.05))
                .frame(width: 80, height: 80)
                .offset(x: -60, y: 60)

            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(appointment.title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)

                        HStack(spacing: 4) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.6))
                            Text(appointment.destination.address)
                                .font(.system(size: 13))
                                .foregroundColor(.white.opacity(0.65))
                                .lineLimit(1)
                        }
                    }

                    Spacer()

                    Text(appointment.status.label)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(appointment.status.color)
                        .cornerRadius(20)
                }
                .padding(.bottom, 20)

                Rectangle()
                    .fill(Color.white.opacity(0.15))
                    .frame(height: 0.5)
                    .padding(.bottom, 16)

                HStack(spacing: 0) {
                    statItem(label: "Orario", value: formattedTime)

                    Rectangle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 0.5, height: 36)

                    statItem(label: "Parti alle", value: formattedDeparture)

                    Rectangle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 0.5, height: 36)

                    statItem(
                        label: "Traffico",
                        value: "\(appointment.trafficDurationMinutes) min"  // fix, non opzionale
                    )
                }
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private func statItem(label: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.system(size: 11))
                .kerning(0.5)
                .textCase(.uppercase)
                .foregroundColor(.white.opacity(0.55))
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    FeatureAppointmentCard(appointment: MockData.nextAppointment)
        .padding()
        .background(Color(hex: "#F7F5FF"))
}
