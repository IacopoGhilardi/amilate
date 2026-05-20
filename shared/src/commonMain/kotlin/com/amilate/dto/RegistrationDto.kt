package com.amilate.dto

import kotlinx.serialization.Serializable

@Serializable
data class RegistrationDto(
    val email: String,
    val password: String,
    val name: String,
    val passwordConfirmation: String
)
