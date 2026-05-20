import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var acceptedTerms = false

    var body: some View {
        ZStack {
            AppBubbleBackground()

            VStack(spacing: 0) {

                HStack {
                    AppButton(type: .back, action: { dismiss() })
                    Spacer()
                }
                .padding(.bottom, 28)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Crea account")
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.textPrimary)
                    Text("Inizia a non essere mai più in ritardo")
                        .font(.system(size: 15))
                        .foregroundColor(.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 32)

                VStack(spacing: 16) {
                    AppTextField(
                        label: "Nome",
                        placeholder: "Il tuo nome",
                        text: $name
                    )

                    AppTextField(
                        label: "Email",
                        placeholder: "La tua email",
                        text: $email
                    )
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                    AppTextField(
                        label: "Password",
                        placeholder: "Almeno 8 caratteri",
                        text: $password,
                        isSecure: true
                    )

                    AppTextField(
                        label: "Conferma password",
                        placeholder: "Ripeti la password",
                        text: $confirmPassword,
                        isSecure: true
                    )

                    HStack(alignment: .top, spacing: 12) {
                        Button(action: { acceptedTerms.toggle() }) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(acceptedTerms ? Color.appPrimary : Color.appSurface)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(acceptedTerms ? Color.appPrimary : Color.appBorder, lineWidth: 1.5)
                                )
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundColor(.white)
                                        .opacity(acceptedTerms ? 1 : 0)
                                )
                        }

                        Text("Accetto i [Termini di servizio](https://tuosito.com/terms) e la [Privacy Policy](https://tuosito.com/privacy)")
                            .font(.system(size: 13))
                            .foregroundColor(.textSecondary)
                            .tint(.appSecondary)
                    }
                }
                .padding(.bottom, 32)

                Spacer()

                VStack(spacing: 12) {
                    AppButton(type: .primary, title: "Registrati", action: {
                        // TODO: chiama il backend
                    })

                    HStack(spacing: 4) {
                        Text("Hai già un account?")
                            .foregroundColor(.textSecondary)
                        AppButton(type: .text, title: "Accedi", destination: LoginView())
                    }
                    .font(.system(size: 14))
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 16)
            .padding(.bottom, 32)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
}
