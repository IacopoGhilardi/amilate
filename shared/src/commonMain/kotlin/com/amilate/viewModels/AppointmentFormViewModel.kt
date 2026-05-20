package com.amilate.viewModels

import co.touchlab.kermit.Logger
import com.amilate.models.Destination
import com.amilate.viewModels.states.AppointmentFormState
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class AppointmentFormViewModel: BaseViewModel() {

    private val logger = Logger.withTag("AppointmentFormViewModel")
    private val _appointmentFormState = MutableStateFlow(AppointmentFormState())
    private val _destinationTab: MutableStateFlow<Int> = MutableStateFlow(0)
    private val _saveAsPreferred: MutableStateFlow<Boolean> = MutableStateFlow(false)
    private val _isSearching: MutableStateFlow<Boolean> = MutableStateFlow(false)
    private val _addressQuery: MutableStateFlow<String> = MutableStateFlow("")
    private val _errorMessages: MutableStateFlow<List<String>> = MutableStateFlow(emptyList())
    private val _isFormValid: MutableStateFlow<Boolean> = MutableStateFlow(false)
    private val _isErrorMessagesVisible: MutableStateFlow<Boolean> = MutableStateFlow(false)

    val appointmentFormState: StateFlow<AppointmentFormState> = _appointmentFormState
    val destinationTab: StateFlow<Int> = _destinationTab
    val saveAsPreferred: StateFlow<Boolean> = _saveAsPreferred
    val isSearching: StateFlow<Boolean> = _isSearching
    val addressQuery: StateFlow<String> = _addressQuery
    val errorMessages: StateFlow<List<String>> = _errorMessages
    val isFormValid: StateFlow<Boolean> = _isFormValid
    val isErrorMessagesVisible: StateFlow<Boolean> = _isErrorMessagesVisible


    fun onAppointmentFormStateChanged(state: AppointmentFormState) {
       _appointmentFormState.value = state
    }

    fun onTitleChanged(title: String) {
        _appointmentFormState.value = _appointmentFormState.value.copy(title = title)
    }

    fun onDescriptionChanged(description: String) {
        _appointmentFormState.value = _appointmentFormState.value.copy(description = description)
    }

    fun onChangeDestination(destination: Destination) {
        _appointmentFormState.value = _appointmentFormState.value.copy(destination = destination)
    }

    fun onChangeDestinationTab(tab: Int) {
        _destinationTab.value = tab
    }

    fun geoCode() {
       logger.i { "Geocode" }
    }

    fun onSearchQueryChanged(query: String) {
        _addressQuery.value = query
    }

    fun onSaveAsPreferredChanged(value: Boolean) {
        _saveAsPreferred.value = value
    }

    fun onSearchStarted() {
        _isSearching.value = true
    }

    fun onSearchFinished() {
        _isSearching.value = false
    }

    fun onSearchCancelled() {
        _isSearching.value = false
    }

    fun onFormValidationChanged(isValid: Boolean) {
        _isFormValid.value = isValid
    }

    fun onErrorMessageChanged(messages: List<String>) {
        _errorMessages.value = messages
    }

    fun onErrorMessageVisibilityChanged(isVisible: Boolean) {
        _isErrorMessagesVisible.value = isVisible
    }

    fun onSave() {
        logger.i { "Save" }
    }
}