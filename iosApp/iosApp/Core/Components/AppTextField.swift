//
//  AppTextField.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 15/03/26.
//

import SwiftUI
import Shared

struct AppTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    @State private var isPasswordVisible: Bool = false

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
                        .autocapitalization(.none)
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
            .background(Color.appSurface)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.appBorder, lineWidth: 1.5)
            )
        }
    }
}
