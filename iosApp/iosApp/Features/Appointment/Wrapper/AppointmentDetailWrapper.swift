//
//  AppointmentDetailWrapper.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 31/03/2026.
//

import SwiftUI
import Shared

@MainActor
class AppointmentDetailWrapper: ObservableObject {
    
    private let viewModel = AppointmentDetailViewModel()
    
    @Published var showDeleteConfirmationDialog: Bool = false;
    @Published var showEditAppointmentDialog: Bool = false;
    
    init() {
        startObserving()
    }
    
    private func startObserving() {
        Task {
            for await value in viewModel.showDeleteConfirmation {
                self.showDeleteConfirmationDialog = value.asBool
            }
        }
        Task {
            for await value in viewModel.showEditAppointment {
                self.showEditAppointmentDialog = value.asBool
            }
        }
    }
    
    func onDeleteAppointmentTapped() {
        viewModel.onDeleteAppointmentClicked()
    }
    
    func onEditAppointmentTapped() {
        viewModel.onEditAppointmentClicked()
    }
}
