import SwiftUI

enum AppointmentCardStyle {
    case featured
    case compact
}

struct AppointmentCard: View {
    let appointment: Appointment
    var style: AppointmentCardStyle = .compact
    var onTap: (() -> Void)? = nil

    var body: some View {
        Group {
            switch style {
                case .featured:
                    FeatureAppointmentCard(appointment: appointment)
                case .compact:
                    CompactAppointmentCard(appointment: appointment)
            }
        }.onTapGesture {
            onTap?()
        }
    }
}
