package com.amilate.models

import kotlinx.serialization.Serializable

@Serializable
data class Destination (
    var id: String,
    var name: String,
    var address: String,
    var latitude: Double,
    var longitude: Double,
    var user: User,
    var googlePlaceId: String?
)