package com.amilate.viewModels

import co.touchlab.kermit.Logger
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class RegisterViewModel {
    private val logger = Logger.withTag("RegisterViewModel")
    private val _email = MutableStateFlow("")
    private val _name = MutableStateFlow("")
    private val _password = MutableStateFlow("")
    private val _passwordConfirmation = MutableStateFlow("")
    private val _termsAccepted = MutableStateFlow(false)

    val email: StateFlow<String> = _email
    val name: StateFlow<String> = _name
    val password: StateFlow<String> = _password
    val passwordConfirmation: StateFlow<String> = _passwordConfirmation
    val termsAccepted: StateFlow<Boolean> = _termsAccepted

    fun onEmailChanged(email: String) {
        _email.value = email
    }

    fun onNameChanged(name: String) {
        _name.value = name
    }

    fun onPasswordChanged(password: String) {
        _password.value = password
    }

    fun onPasswordConfirmationChanged(passwordConfirmation: String) {
        _passwordConfirmation.value = passwordConfirmation
    }

    fun onTermsAcceptedChanged(termsAccepted: Boolean) {
        _termsAccepted.value = termsAccepted
    }

    fun register() {
        logger.d { "Register: ${email.value}, ${name.value}, ${password.value}, ${passwordConfirmation.value}, ${termsAccepted.value}" }
    }
}