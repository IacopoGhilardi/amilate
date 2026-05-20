//
//  DinamicAppLogo.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 15/03/26.
//
import SwiftUI

struct DinamicAppLogo: View {
    var size: CGFloat = 160
    
    var body: some View {
        Image("logo_dinamico")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
}
