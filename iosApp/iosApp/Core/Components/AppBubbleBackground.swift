//
//  AppBubbleBackground.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 14/03/26.
//
import SwiftUI

struct AppBubbleBackground: View {
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            Circle()
                .fill(Color(hex: "#E3DEFE").opacity(0.75))
                .frame(width: 300, height: 300)
                .offset(x: 110, y: -350)

            Circle()
                .fill(Color(hex: "#E8E4FE").opacity(0.65))
                .frame(width: 250, height: 250)
                .offset(x: -200, y: -30)

            Circle()
                .fill(Color(hex: "#E3DEFE").opacity(0.55))
                .frame(width: 250, height: 250)
                .offset(x: 130, y: 320)
        }
    }
}
