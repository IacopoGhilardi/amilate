package com.amilate.viewModels

import co.touchlab.kermit.Logger
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class AppViewModel : BaseViewModel() {

    private val logger = Logger.withTag("AppViewModel")

    private val _isLoggedIn = MutableStateFlow(false)
    val isLoggedIn: StateFlow<Boolean> = _isLoggedIn

    init {
        checkSession()
    }

    private fun checkSession() {
//        launch {
//            val isValid = withContext(Dispatchers.IO) {
//                tokenStorage.isTokenValid()
//            }
//            _isLoggedIn.value = isValid
//        }
        _isLoggedIn.value = true
    }

    fun login() {
        _isLoggedIn.value = true
    }

    fun logout() {
        launch {
            _isLoggedIn.value = false
        }
    }
}