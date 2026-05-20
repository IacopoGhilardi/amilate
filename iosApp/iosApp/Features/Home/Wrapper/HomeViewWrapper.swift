//
// Created by Iacopo Ghilardi on 28/03/2026.
//
import SwiftUI
import Shared

@MainActor
class HomeViewWrapper: BaseViewWrapper {

    private let viewModel = HomeViewModel()

    @Published var selectedAppointment: Appointment? = nil
    @Published var showAddAppointmentDialog: Bool = false

    init() {
        startObserving()
    }

    private func startObserving() {
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
    }

    func onAddAppointmentTapped() {
        viewModel.onAddAppointmentTapped()
    }

    func onAddAppointmentDialogClosed() {
        viewModel.onAddAppointmentDialogClosed()
    }

    func onDetailAppointmentDialogClosed() {
        viewModel.onDetailAppointmentDialogClosed()
    }
}
