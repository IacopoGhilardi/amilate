package com.amilate.viewModels.states

import com.amilate.models.Destination
import kotlinx.datetime.LocalDate
import kotlinx.datetime.TimeZone
import kotlinx.datetime.toLocalDateTime
import kotlin.time.Clock

data class AppointmentFormState(
    val title: String = "",
    val description: String = "",
    val date: LocalDate = Clock.System.now()
        .toLocalDateTime(TimeZone.currentSystemDefault()).date,
    val userId: String = "",
    val destination: Destination? = null
)
