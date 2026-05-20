//
//  CalendarViewWrapper.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 29/03/2026.
//
import SwiftUI
import Shared

@MainActor
class CalendarViewWrapper: BaseViewWrapper {
    
    private let viewModel = CalendarViewModel()
    
    @Published var selectedAppointment: Appointment? = nil
    @Published var showAddAppointmentDialog: Bool = false
    @Published var showDetailAppointmentDialog: Bool = false
    
    override init() {
        super.init()
        startObserving()
    }
    
    private func startObserving() {
        observeLoadingState(
            isLoading: viewModel.isLoading,
            errorMessage: viewModel.errorMessage
        )
        Task {
            for await value in viewModel.selectedAppointment {
                self.selectedAppointment = value
            }
        }
        Task {
            for await value in viewModel.showAddAppointmentDialog {
                self.showAddAppointmentDialog = value.boolValue
            }
        }
    }
    
    func onAppointmentClicked(_ appointment: Appointment) {
        viewModel.onAppointmentClicked(appointment: appointment)
        showDetailAppointmentDialog = true
    }
    
    func onAddAppointmentTapped() {
        showAddAppointmentDialog = true
    }
    
    func onAddAppointmentDialogClosed() {
        viewModel.onAddAppointmentDialogClosed()
        showAddAppointmentDialog = false
    }
    
    func onDetailAppointmentDialogClosed() {
        viewModel.onAddAppointmentDialogClosed()
        showDetailAppointmentDialog = false
    }
    
    func onDateSelected(_ date: Date) {
        let timestamp = Int64(date.timeIntervalSince1970 * 1000)
        viewModel.onDateSelected(date: timestamp)
    }
}
