//
//  HomeView.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 18/03/26.
//
import SwiftUI
import Shared

struct HomeView: View {
    @Binding var selectedTab: AppTab
    @StateObject private var vm = HomeViewWrapper()
    private let nextAppointment = MockData.nextAppointment
    private let upcomingAppointments = MockData.upcomingAppointments

    var body: some View {
        NavigationStack {
            ZStack {
                AppBubbleBackground()
                ScrollView {
                    VStack(spacing: 24) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Non arrivare più in ritardo")
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(.appSecondary)
                                Text("Ciao Marco")
                                .font(.system(size: 32).bold())
                                .foregroundColor(.textPrimary)
                            }
                            Spacer()
                        }
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Prossimo appuntamento")
                            .font(.system(size: 11, design: .monospaced))
                            .kerning(2)
                            .textCase(.uppercase)
                            .foregroundColor(.appSecondary)
                            AppointmentCard(appointment: nextAppointment, style: .featured) {
                                vm.onAppointmentClicked(nextAppointment)
                            }
                        }
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Prossimamente")
                                .font(.system(size: 11, design: .monospaced))
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(.appSecondary)
                                Spacer()
                                Button("Vedi tutti") {
                                    selectedTab = .calendar
                                }
                                .font(.system(size: 12))
                                .foregroundColor(.textTertiary)
                            }
                            ForEach(upcomingAppointments, id: \.id) { appointment in
                                AppointmentCard(appointment: appointment, style: .compact) {
                                    vm.onAppointmentClicked(appointment)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    .padding(.bottom, 100)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { vm.onAddAppointmentTapped() }) {
                        Image(systemName: "plus")
                        .foregroundColor(.appPrimary)
                    }
                }
            }
            .sheet(isPresented: Binding(
                get: { vm.selectedAppointment != nil },
                set: { if !$0 { vm.onDetailAppointmentDialogClosed() } }
            )) {
                if let appointment = vm.selectedAppointment {
                    AppointmentDetail(
                        appointment: appointment,
                        onDelete: { vm.onDetailAppointmentDialogClosed() }
                    )
                    .presentationDetents([PresentationDetent.large])
                    .presentationDragIndicator(Visibility.visible)
                }
            }
            .sheet(isPresented: Binding(
                get: { vm.showAddAppointmentDialog },
                set: { if !$0 { vm.onAddAppointmentDialogClosed() } }
            )) {
                AppointmentForm()
                    .presentationDetents([PresentationDetent.large])
                    .presentationDragIndicator(Visibility.visible)
            }
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(.home))
}
