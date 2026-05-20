//
//  LoginWrapper.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 02/04/2026.
//

import SwiftUI
import Shared

@MainActor
class LoginViewWrapper: BaseViewWrapper {
    
    private let viewModel = LoginViewModel()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isFormValid: Bool = false
    
    // binding — proprietà della classe, non dentro startObserving
    var emailBinding: Binding<String> {
        Binding(
            get: { self.email },
            set: { self.onEmailChanged($0) }
        )
    }
    
    var passwordBinding: Binding<String> {
        Binding(
            get: { self.password },
            set: { self.onPasswordChanged($0) }
        )
    }
    
    override init() {
        super.init()
        startObserving()
    }
    
    private func startObserving() {
        // delega isLoading ed errorMessage alla base
        observeLoadingState(
            isLoading: viewModel.isLoading,
            errorMessage: viewModel.errorMessage
        )
        Task {
            for await value in viewModel.email { self.email = value }
        }
        Task {
            for await value in viewModel.password { self.password = value }
        }
        Task {
            for await value in viewModel.isFormValid { self.isFormValid = value.boolValue }
        }
    }
    
    // metodi — proprietà della classe, non dentro startObserving
    func onEmailChanged(_ email: String) {
        viewModel.onEmailChanged(email: email)
    }
    
    func onPasswordChanged(_ password: String) {
        viewModel.onPasswordChanged(password: password)
    }
    
    func login() {
        viewModel.login()
    }
}
