import SwiftUI
import Shared

struct CalendarView: View {
    @State private var selectedDate = Date()
    @StateObject private var vm = CalendarViewWrapper()

    private var appointmentsForSelectedDate: [Appointment] {
        let calendar = Calendar.current
        return MockData.allAppointments.filter {
            calendar.isDate($0.date.asDate, inSameDayAs: selectedDate)
        }
    }

    private var formattedSelectedDate: String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "it_IT")
        if calendar.isDateInToday(selectedDate) {
            return "Oggi"
        } else if calendar.isDateInTomorrow(selectedDate) {
            return "Domani"
        } else {
            formatter.dateFormat = "d MMMM"
            return formatter.string(from: selectedDate)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                AppBubbleBackground()

                ScrollView {
                    VStack(spacing: 24) {

                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("I tuoi impegni")
                                    .font(.system(size: 12, design: .monospaced))
                                    .foregroundColor(.appSecondary)
                                Text("Calendario")
                                    .font(.system(size: 32).bold())
                                    .foregroundColor(.textPrimary)
                            }
                            Spacer()
                        }

                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .tint(.appPrimary)
                            .padding()
                            .background(Color.appSurface)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.appBorder, lineWidth: 1.5)
                            )

                        VStack(alignment: .leading, spacing: 12) {
                            Text(formattedSelectedDate)
                                .font(.system(size: 11, design: .monospaced))
                                .kerning(2)
                                .textCase(.uppercase)
                                .foregroundColor(.appSecondary)

                            if appointmentsForSelectedDate.isEmpty {
                                VStack(spacing: 8) {
                                    Image(systemName: "calendar.badge.checkmark")
                                        .font(.system(size: 36))
                                        .foregroundColor(.appBorder)
                                    Text("Nessun appuntamento")
                                        .font(.system(size: 14))
                                        .foregroundColor(.textTertiary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 32)
                            } else {
                                ForEach(appointmentsForSelectedDate, id: \.id) { appointment in  // fix
                                    AppointmentCard(appointment: appointment, style: .compact) {
                                        vm.onAppointmentClicked(appointment)
                                    }
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
        }
        .sheet(isPresented: $vm.showDetailAppointmentDialog) {
            if let appointment = vm.selectedAppointment {
                AppointmentDetail(
                    appointment: appointment,
                    onDelete: { vm.onDetailAppointmentDialogClosed() }
                )
                .presentationDetents([PresentationDetent.large])
                .presentationDragIndicator(Visibility.visible)
            }
        }
        .sheet(isPresented: $vm.showAddAppointmentDialog) {
            AppointmentForm()
                .presentationDetents([PresentationDetent.large])
                .presentationDragIndicator(Visibility.visible)
        }
    }
}

#Preview {
    CalendarView()
}
