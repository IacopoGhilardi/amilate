package com.amilate.viewModels

import co.touchlab.kermit.Logger
import com.amilate.models.Appointment
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class CalendarViewModel: BaseViewModel() {
    private val logger = Logger.withTag("CalendarViewModel")
    private val _selectedDate = MutableStateFlow<Long?>(null)
    private val _showAddAppointmentDialog = MutableStateFlow(false)
    private val _showDetailAppointmentDialog = MutableStateFlow(false)
    private val _selectedAppointment = MutableStateFlow<Appointment?>(null)

    val selectedDate: StateFlow<Long?> = _selectedDate
    val showAddAppointmentDialog: StateFlow<Boolean> = _showAddAppointmentDialog
    val showDetailAppointmentDialog: StateFlow<Boolean> = _showDetailAppointmentDialog
    val selectedAppointment: StateFlow<Appointment?> = _selectedAppointment

    fun onDateSelected(date: Long) {
        logger.d { "Date selected: $date" }
        _selectedDate.value = date
    }

    fun onAddAppointmentTapped() {
        _showAddAppointmentDialog.value = true
    }

    fun onAddAppointmentDialogClosed() {
        _showAddAppointmentDialog.value = false
    }

    fun onAppointmentClicked(appointment: Appointment) {
        logger.d { "Appointment clicked: $appointment" }
        _selectedAppointment.value = appointment
        _showDetailAppointmentDialog.value = true
    }

    fun onDetailAppointmentDialogClosed() {
        _showDetailAppointmentDialog.value = false
        _selectedAppointment.value = null
    }
}