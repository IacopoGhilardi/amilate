package com.amilate.viewModels

import co.touchlab.kermit.Logger
import com.amilate.utils.FormValidator
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.stateIn

class LoginViewModel: BaseViewModel() {
    private val logger = Logger.withTag("LoginViewModel")
    private val _email = MutableStateFlow("")
    private val _password = MutableStateFlow("")

    val email: StateFlow<String> = _email
    val password: StateFlow<String> = _password

    fun onEmailChanged(email: String) {
        _email.value = email
    }

    fun onPasswordChanged(password: String) {
        _password.value = password
    }

    fun login() {
        logger.d { "Login: ${email.value}, ${password.value}" }
        //Todo: Backend call for login
    }

    fun socialLogin() {
        logger.d { "Social login" }
        //Todo: Backend call for social login
    }

    val isFormValid: StateFlow<Boolean> = combine(_email, _password) { email, password ->
        FormValidator.isValidEmail(email) && FormValidator.isValidPassword(password)
    }.stateIn(scope, SharingStarted.Eagerly, false)
}