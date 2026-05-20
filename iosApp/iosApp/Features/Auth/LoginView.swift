import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = LoginViewWrapper()

    var body: some View {
        ZStack {
            AppBubbleBackground()

            VStack(spacing: 0) {

                HStack {
                    AppButton(type: .back, action: { dismiss() })
                    Spacer()
                }
                .padding(.bottom, 24)

                VStack(alignment: .center, spacing: 8) {
                    Text("Bentornato")
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.textPrimary)
                    Text("Accedi al tuo account")
                        .font(.system(size: 15))
                        .foregroundColor(.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 32)

                VStack(spacing: 16) {
                    AppTextField(
                        label: "Email",
                        placeholder: "La tua email",
                        text: vm.emailBinding
                    )
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                    AppTextField(
                        label: "Password",
                        placeholder: "La tua password",
                        text: vm.passwordBinding,
                        isSecure: true
                    )

                    HStack {
                        Spacer()
                        AppButton(type: .text, title: "Password dimenticata?", action: { })
                    }
                }
                .padding(.bottom, 32)

                Spacer()

                VStack(spacing: 12) {
                    AppButton(type: .primary, title: "Accedi", action: {
                        vm.login()
                    })
                    .disabled(!vm.isFormValid)

                    HStack {
                        Rectangle().fill(Color.appBorder).frame(height: 1)
                        Text("oppure")
                            .font(.footnote)
                            .foregroundColor(.textTertiary)
                            .fixedSize()
                        Rectangle().fill(Color.appBorder).frame(height: 1)
                    }

                    HStack(spacing: 12) {
                        SignInWithAppleButton(.signIn) { request in
                            request.requestedScopes = [.fullName, .email]
                        } onCompletion: { result in
                            handleAppleSignIn(result)
                        }
                        .signInWithAppleButtonStyle(.whiteOutline)
                        .frame(height: 54)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.black, lineWidth: 1.5)
                        )

                        Button(action: {}) {
                            HStack(spacing: 8) {
                                Image(systemName: "globe")
                                    .font(.system(size: 18))
                                Text("Google")
                                    .font(.system(size: 15, weight: .medium))
                            }
                            .foregroundColor(.textPrimary)
                            .frame(maxWidth: .infinity)
                            .frame(height: 54)
                            .background(Color.appSurface)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black, lineWidth: 1.5)
                            )
                        }
                    }

                    HStack(spacing: 4) {
                        Text("Non hai un account?")
                            .foregroundColor(.textSecondary)
                        NavigationLink(destination: RegisterView()) {
                            Text("Registrati")
                                .foregroundColor(.appSecondary)
                                .fontWeight(.medium)
                        }
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

    private func handleAppleSignIn(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            guard let credential = auth.credential as? ASAuthorizationAppleIDCredential else { return }
            let userID = credential.user
            let email = credential.email ?? ""
            let fullName = credential.fullName?.givenName ?? ""
            print("Apple sign in: \(userID), \(email), \(fullName)")
            // TODO: manda al backend
        case .failure(let error):
            print("Apple sign in error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
