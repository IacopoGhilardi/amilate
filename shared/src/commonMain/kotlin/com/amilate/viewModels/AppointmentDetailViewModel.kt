package com.amilate.viewModels

import co.touchlab.kermit.Logger
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class AppointmentDetailViewModel: BaseViewModel() {

    private val logger = Logger.withTag("AppointmentDetailViewModel")
    private val _showDeleteConfirmationDialog = MutableStateFlow(false)
    private val _showEditAppointmentDialog = MutableStateFlow(false)

    val showDeleteConfirmation: StateFlow<Boolean> = _showDeleteConfirmationDialog
    val showEditAppointment: StateFlow<Boolean> = _showEditAppointmentDialog

    fun onDeleteAppointmentClicked() {
        _showDeleteConfirmationDialog.value = true
    }

    fun onEditAppointmentClicked() {
        _showEditAppointmentDialog.value = true
    }
}