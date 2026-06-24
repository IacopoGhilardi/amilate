//
//  PrimaryTheme.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 22/06/2026.
//

import SwiftUI

extension Color {
    // Brand
    static let appPrimary = Color(hex: "#4F46E5")      // indigo — bottone primario, accenti
    static let appSecondary = Color(hex: "#7C3AED")    // viola — tagline, link, dettagli

    // Backgrounds
    static let appBackground = Color(hex: "#F7F5FF")   // lavanda chiarissimo — sfondo principale
    static let appSurface = Color(hex: "#FFFFFF")      // bianco — cards, bottone secondario

    // Semantic
    static let appSuccess = Color(hex: "#10B981")      // verde — in orario
    static let appError = Color(hex: "#EF4444")        // rosso — in ritardo
    static let appWarning = Color(hex: "#F59E0B")      // ambra — parti ora

    // Text
    static let textPrimary = Color(hex: "#1E1B4B")     // indigo scurissimo — titoli
    static let textSecondary = Color(hex: "#6B7280")   // grigio — descrizioni
    static let textTertiary = Color(hex: "#9CA3AF")    // grigio chiaro — note, termini

    // Borders
    static let appBorder = Color(hex: "#DDD6FE")       // lavanda — bordi cards e bottoni
}

extension Font {
    static let appTitle = Font.system(size: 24, weight: .bold)
    static let appBody = Font.system(size: 16, weight: .regular)
    static let appCaption = Font.system(size: 12, weight: .medium)
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
