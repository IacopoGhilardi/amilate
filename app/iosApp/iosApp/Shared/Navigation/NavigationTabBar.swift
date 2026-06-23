//
//  NavigationTabBar.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 22/06/2026.
//

import SwiftUI

struct NavigationTabBar: View {
    @State private var selectedTab: AppTab = .home

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        let normalColor = UIColor(Color.textTertiary)
        let selectedColor = UIColor(Color.appPrimary)
        
        appearance.stackedLayoutAppearance.normal.iconColor = normalColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: normalColor,
            .font: UIFont.systemFont(ofSize: 10, weight: .medium)
        ]
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
                ForEach(AppTab.allCases, id: \.self) { tab in
                    Tab(tab.label, systemImage: tab.icon, value: tab) {
                        destinationView(for: tab)
                    }
                }
            }
            .tint(Color.appPrimary)
            .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        } else {
            TabView(selection: $selectedTab) {
                ForEach(AppTab.allCases, id: \.self) { tab in
                    destinationView(for: tab)
                        .tabItem { Label(tab.label, systemImage: tab.icon) }
                        .tag(tab)
                }
            }
            .tint(Color.appPrimary)
        }
    }
    
    @ViewBuilder
    private func destinationView(for tab: AppTab) -> some View {
        switch tab {
        case .home:        HomeView(selectedTab: $selectedTab)
        case .calendar:    CalendarView()
        case .destinations: DestinationView()
        case .profile:     ProfileView()
        }
    }
}

#Preview("iOS 18") {
    NavigationTabBar()
}

#Preview("iOS 17") {
    NavigationTabBar()
}
