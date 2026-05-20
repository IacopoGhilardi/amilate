//
//  AppointmentStatusExtension.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 29/03/2026.
//

import Shared
import SwiftUI

extension AppointmentStatus {
    var color: Color {
        if self is AppointmentStatus.OnTime {
            return .green
        } else if self is AppointmentStatus.LeaveNow {
            return .orange
        } else if self is AppointmentStatus.Late {
            return .red
        } else {
            return Color.appSecondary
        }
    }
    
    var icon: String {
        if self is AppointmentStatus.OnTime {
            return "checkmark.circle.fill"
        } else if self is AppointmentStatus.LeaveNow {
            return "figure.walk"
        } else if self is AppointmentStatus.Late {
            return "exclamationmark.triangle.fill"
        } else {
            return "clock.fill"
        }
    }
}
