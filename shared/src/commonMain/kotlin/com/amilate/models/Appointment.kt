package com.amilate.models

import com.amilate.commons.AppointmentStatus
import kotlinx.datetime.LocalDate
import kotlinx.datetime.LocalDateTime
import kotlinx.serialization.Serializable

@Serializable
data class Appointment (
    val id: String,
    val title: String,
    var date: LocalDate,
    var destination: Destination,
    var status: AppointmentStatus,
    var departureTime: LocalDateTime,
    var trafficDurationMinutes: Int,
    var distanceKm: Double,
    var user: User
)

