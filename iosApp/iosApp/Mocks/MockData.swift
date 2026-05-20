//
//  MockData.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 29/03/2026.
//
import Shared
import Foundation

struct MockData {
    
    static let allAppointments: [Appointment] = [nextAppointment] + upcomingAppointments

    static let userProfile = UserProfile(
        userId: "user-1",
        bufferMinutesDefault: 10,
        locationPermission: false,
        notificationsEnabled: true,
        deviceToken: nil,
        lastLocation: nil
    )

    static let user = User(
        id: "user-1",
        name: "Marco",
        email: "marco@example.com",
        appointments: nil,
        destinations: nil,
        profile: userProfile,
        hasCompletedOnboarding: true
    )

    static let destination1 = Destination(
        id: UUID().uuidString,
        name: "Dentista",
        address: "Via Roma 12, Milano",
        latitude: 45.4642,
        longitude: 9.1900,
        user: user,
        googlePlaceId: nil
    )

    static let destination2 = Destination(
        id: UUID().uuidString,
        name: "Ufficio",
        address: "Via Milano 5",
        latitude: 45.46,
        longitude: 9.19,
        user: user,
        googlePlaceId: nil
    )

    static let destination3 = Destination(
        id: UUID().uuidString,
        name: "Malpensa",
        address: "Malpensa T1",
        latitude: 45.63,
        longitude: 8.72,
        user: user,
        googlePlaceId: nil
    )

    static let nextAppointment = Appointment(
        id: UUID().uuidString,
        title: "Dentista",
        date: LocalDate(year: 2026, month: 3, day: 29),
        destination: destination1,
        status: AppointmentStatus.OnTime.shared,
        departureTime: LocalDateTime(year: 2026, month: 3, day: 29, hour: 14, minute: 30, second: 0, nanosecond: 0),
        trafficDurationMinutes: 23,
        distanceKm: 5.2,
        user: user
    )

    static let upcomingAppointments: [Appointment] = [
        Appointment(
            id: UUID().uuidString,
            title: "Riunione lavoro",
            date: LocalDate(year: 2026, month: 3, day: 30),
            destination: destination2,
            status: AppointmentStatus.Upcoming.shared
            ,
            departureTime: LocalDateTime(year: 2026, month: 3, day: 30, hour: 14, minute: 30, second: 0, nanosecond: 0),
            trafficDurationMinutes: 15,
            distanceKm: 2.1,
            user: user
        ),
        Appointment(
            id: UUID().uuidString,
            title: "Aeroporto Malpensa",
            date: LocalDate(year: 2026, month: 3, day: 31),
            destination: destination3,
            status: AppointmentStatus.Upcoming.shared,
            departureTime: LocalDateTime(year: 2026, month: 3, day: 31, hour: 14, minute: 30, second: 0, nanosecond: 0),
            trafficDurationMinutes: 45,
            distanceKm: 48.0,
            user: user
        )
    ]
}
