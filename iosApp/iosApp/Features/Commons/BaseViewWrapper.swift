//
//  BaseViewWrapper.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 10/05/2026.
//

import SwiftUI
import Shared

@MainActor
class BaseViewWrapper: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func observeLoadingState(
        isLoading: SkieSwiftStateFlow<KotlinBoolean>,
        errorMessage: SkieSwiftOptionalStateFlow<String>
    ) {
        Task {
            for await value in isLoading {
                self.isLoading = value.boolValue
            }
        }
        Task {
            for await value in errorMessage {
                self.errorMessage = value
            }
        }
    }
}
