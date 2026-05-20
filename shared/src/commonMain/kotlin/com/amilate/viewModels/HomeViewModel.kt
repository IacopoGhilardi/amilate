package com.amilate.viewModels

import co.touchlab.kermit.Logger
import com.amilate.models.Appointment
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class HomeViewModel: BaseViewModel() {
    private val logger = Logger.withTag("HomeViewModel")
    private val _selectedAppointment = MutableStateFlow<Appointment?>(null)
    private val _showAddAppointmentDialog = MutableStateFlow(false)

    val selectedAppointment: StateFlow<Appointment?> = _selectedAppointment
    val showAddAppointmentDialog: StateFlow<Boolean> = _showAddAppointmentDialog

    fun onAppointmentClicked(appointment: Appointment) {
        logger.d { "Appointment clicked: $appointment" }
        _selectedAppointment.value = null
        _selectedAppointment.value = appointment
    }

    fun onAddAppointmentTapped() {
        _showAddAppointmentDialog.value = true
    }

    fun onDetailAppointmentDialogClosed() {
        _selectedAppointment.value = null
    }

    fun onAddAppointmentDialogClosed() {
        _showAddAppointmentDialog.value = false
    }
}