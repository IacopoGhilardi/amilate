package com.amilate.models

import kotlinx.serialization.Serializable

@Serializable
data class User(
    val id: String,
    val name: String,
    val email: String,
    val appointments: List<Appointment>?,
    val destinations: List<Destination>?,
    val profile: UserProfile?,
    val hasCompletedOnboarding: Boolean = false
)
