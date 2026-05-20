//
//  NavigationTabBar.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 19/03/26.
//
import SwiftUI

struct NavigationTabBar: View {
    @State private var selectedTab: AppTab = .home

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray3
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.systemGray3,
            .font: UIFont.systemFont(ofSize: 10, weight: .medium)
        ]
        
        let selectedColor = UIColor(red: 0.31, green: 0.27, blue: 0.87, alpha: 0.75)
        appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: selectedColor,
            .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        if #available(iOS 18, *) {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house.fill", value: .home) {
                    HomeView(selectedTab: $selectedTab)
                }
                Tab("Calendario", systemImage: "calendar.badge.clock", value: .calendar) {
                    CalendarView()
                }
                Tab("Destinazioni", systemImage: "mappin.and.ellipse", value: .destinations) {
                    DestinationView()
                }
                Tab("Profilo", systemImage: "person.crop.circle.fill", value: .profile) {
                    ProfileView()
                }
            }
            .tint(Color(red: 0.31, green: 0.27, blue: 0.87, opacity: 0.75))
            .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        } else {
            TabView(selection: $selectedTab) {
                HomeView(selectedTab: $selectedTab)
                    .tabItem { Label("Home", systemImage: "house.fill") }
                    .tag(AppTab.home)

                CalendarView()
                    .tabItem { Label("Calendario", systemImage: "calendar.badge.clock") }
                    .tag(AppTab.calendar)

                DestinationView()
                    .tabItem { Label("Destinazioni", systemImage: "mappin.and.ellipse") }
                    .tag(AppTab.destinations)

                ProfileView()
                    .tabItem { Label("Profilo", systemImage: "person.crop.circle.fill") }
                    .tag(AppTab.profile)
            }
            .tint(Color(red: 0.31, green: 0.27, blue: 0.87, opacity: 0.75))
        }
    }
}

#Preview("iOS 26 - Liquid Glass") {
    NavigationTabBar()
}

#Preview("iOS 17 - Standard") {
    @Previewable @State var selectedTab: AppTab = .home
    
    TabView(selection: $selectedTab) {
        HomeView(selectedTab: $selectedTab)
            .tabItem { Label("Home", systemImage: "house.fill") }
            .tag(AppTab.home)
        
        CalendarView()
            .tabItem { Label("Calendario", systemImage: "calendar.badge.clock") }
            .tag(AppTab.calendar)
        
        DestinationView()
            .tabItem { Label("Destinazioni", systemImage: "mappin.and.ellipse") }
            .tag(AppTab.destinations)
        
        ProfileView()
            .tabItem { Label("Profilo", systemImage: "person.crop.circle.fill") }
            .tag(AppTab.profile)
    }
    .tint(Color(red: 0.31, green: 0.27, blue: 0.87, opacity: 0.75))
}
