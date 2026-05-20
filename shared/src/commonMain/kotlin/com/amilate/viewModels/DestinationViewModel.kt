package com.amilate.viewModels

import co.touchlab.kermit.Logger
import com.amilate.models.Destination
import kotlinx.coroutines.flow.MutableStateFlow

class DestinationViewModel {

    private val logger = Logger.withTag("DestinationViewModel")
    private val _selectedDestination = MutableStateFlow<Destination?>(null)
    private val _showDestinationDetailDialog = MutableStateFlow(false)
    private val _showAddAppointmentDialog = MutableStateFlow(false)
}