//
//  AppTab.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 22/06/2026.
//

enum AppTab: CaseIterable, Hashable {
    case home, calendar, destinations, profile

    var icon: String {
        switch self {
        case .home:         return "house.fill"
        case .calendar:     return "calendar.badge.clock"
        case .destinations: return "mappin.and.ellipse"
        case .profile:      return "person.crop.circle.fill"  // allineato con NavigationTabBar
        }
    }

    var label: String {
        switch self {
        case .home:         return "Home"
        case .calendar:     return "Calendario"
        case .destinations: return "Destinazioni"
        case .profile:      return "Profilo"
        }
    }
}
