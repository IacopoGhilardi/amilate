package com.amilate.models

import kotlinx.serialization.Serializable

@Serializable
data class UserProfile(
    val userId: String,
    val bufferMinutesDefault: Int = 10,
    val locationPermission: Boolean = false,
    val notificationsEnabled: Boolean = true,
    val deviceToken: String? = null,
    val lastLocation: String? = null
)