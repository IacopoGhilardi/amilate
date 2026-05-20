//
//  CompactAppointmentCard.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 22/03/26.
//
import SwiftUI
import Shared

struct CompactAppointmentCard: View {
    let appointment: Appointment
    
    private var formattedDate: String {
        let calendar = Calendar.current
        let date = appointment.date.asDate  // conversione
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: appointment.departureTime.asDate)
        if calendar.isDateInToday(date) {
            return "Oggi • \(time)"
        } else if calendar.isDateInTomorrow(date) {
            return "Domani • \(time)"
        } else {
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "d MMM"
            dayFormatter.locale = Locale(identifier: "it_IT")
            return "\(dayFormatter.string(from: date)) • \(time)"
        }
    }
    
    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 14)
                .fill(appointment.status.color.opacity(0.15))
                .frame(width: 46, height: 46)
                .overlay(
                    Image(systemName: "clock.fill")
                        .font(.system(size: 20))
                        .foregroundColor(appointment.status.color)
                )
            VStack(alignment: .leading, spacing: 3) {
                Text(appointment.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.textPrimary)
                Text(formattedDate)
                    .font(.system(size: 12))
                    .foregroundColor(.textTertiary)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(appointment.status.label)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(appointment.status.color)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(appointment.status.color.opacity(0.12))
                    .cornerRadius(10)
                // trafficDurationMinutes è Int, non opzionale
                Text("~\(appointment.trafficDurationMinutes) min")
                    .font(.system(size: 11))
                    .foregroundColor(.textTertiary)
            }
        }
        .padding(14)
        .background(Color.appSurface)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(appointment.status.color.opacity(
                    appointment.status == AppointmentStatus.Upcoming.shared ? 0 : 0.3
                ), lineWidth: 1.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.appBorder, lineWidth: 1.5)
                        .opacity(appointment.status == AppointmentStatus.Upcoming.shared ? 1 : 0)
                )
        )
    }
}

#Preview {
    VStack(spacing: 10) {
        CompactAppointmentCard(appointment: MockData.nextAppointment)
        CompactAppointmentCard(appointment: MockData.upcomingAppointments[0])
        CompactAppointmentCard(appointment: MockData.upcomingAppointments[1])
    }
    .padding()
    .background(Color(hex: "#F7F5FF"))
}
