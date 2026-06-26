//
//  AppButton.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 24/06/2026.
//

import SwiftUI

enum AppButtonType {
    case primary
    case secondary
    case destructive
    case back
    case text
}

struct AppButton<Destination: View>: View {
    let type: AppButtonType
    var title: String = ""
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            buttonLabel
        }
    }

    @ViewBuilder
    private var buttonLabel: some View {
        switch type {
        case .primary:
            Text(title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.appPrimary)
                .foregroundColor(.white)
                .cornerRadius(18)

        case .secondary:
            Text(title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.appSurface)
                .foregroundColor(Color.appPrimary)
                .cornerRadius(18)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.appPrimary, lineWidth: 1.5)
                )
            
        case .destructive:
            Text(title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.appError)
                .foregroundColor(.white)
                .cornerRadius(18)

        case .back:
            HStack(spacing: 6) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .semibold))
                Text("Indietro")
                    .font(.system(size: 14))
            }
            .foregroundColor(.appSecondary)

        case .text:
            Text(title)
                .font(.system(size: 13))
                .foregroundColor(.appSecondary)
        }
    }
}
