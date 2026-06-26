//
//  AppTextField.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 24/06/2026.
//
import SwiftUI
import SharedLogic

struct AppTextField: View {
    let label: String
    let placeholder: String
    var isSecure: Bool = false
    @Binding var text: String
    @State private var isPasswordVisible: Bool = false
    @FocusState private var isFocused: Bool
    var errorMessage: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(size: 11, design: .monospaced))
                .kerning(1)
                .textCase(.uppercase)
                .foregroundColor(.textSecondary)

            ZStack(alignment: .trailing) {
                if isSecure && !isPasswordVisible {
                    SecureField(placeholder, text: $text)
                        .padding(16)
                } else {
                    TextField(placeholder, text: $text)
                        .padding(16)
                        .textInputAutocapitalization(.none)
                }

                if isSecure {
                    Button(action: { isPasswordVisible.toggle() }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.textTertiary)
                            .font(.system(size: 16))
                    }
                    .padding(.trailing, 16)
                }
            }
            .focused($isFocused)
            .background(Color.appSurface)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(
                        errorMessage != nil ? Color.appError :
                        isFocused ? Color.appPrimary : Color.appBorder,
                        lineWidth: 1.5
                    )
            )
        }
        
        if let error = errorMessage {
            Text(error)
                .font(.caption)
                .foregroundColor(.appError)
        }
    }
}
