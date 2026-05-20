package com.amilate.commons

import kotlinx.serialization.Serializable

@Serializable
sealed class AppointmentStatus {

    object OnTime : AppointmentStatus()
    object LeaveNow : AppointmentStatus()
    object Upcoming : AppointmentStatus()
    data class Late(val minutesLate: Int) : AppointmentStatus()

    val label: String get() = when (this) {
        is OnTime   -> "In orario"
        is LeaveNow -> "Parti ora!"
        is Late     -> "Ritardo $minutesLate min"
        is Upcoming -> "In arrivo"
    }
}