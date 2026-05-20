//
//  LandingPage.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 14/03/26.
//
import SwiftUI
import Shared

struct LandingView: View {
    var body: some View {
        ZStack {
            AppBubbleBackground()

            VStack(spacing: 0) {

                DinamicAppLogo(size: 200)
                    .padding(.top, 60)
                    .padding(.bottom, 24)

                VStack(spacing: 8) {
                    Text("Am I Late?")
                        .font(.system(size: 48, weight: .black))
                        .foregroundColor(.textPrimary)

                    Text("il tuo assistente puntuale")
                        .font(.system(size: 11, design: .monospaced))
                        .kerning(3)
                        .textCase(.uppercase)
                        .foregroundColor(.appSecondary)
                }
                .multilineTextAlignment(.center)

                Spacer()

                VStack(spacing: 12) {
                    AppButton(type: .primary, title: "Inizia ora", destination: RegisterView())
                    AppButton(type: .secondary, title: "Ho già un account", destination: LoginView())
                    Text("Continuando accetti i [Termini di servizio](https://tuosito.com/terms) e la [Privacy Policy](https://tuosito.com/privacy)")
                        .font(.footnote)
                        .foregroundColor(.textTertiary)
                        .multilineTextAlignment(.center)
                        .tint(.appSecondary)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 32)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        LandingView()
    }
}
