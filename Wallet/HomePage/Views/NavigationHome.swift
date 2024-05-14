//
//  NavigationHome.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI


struct NavigationHome: View {
    var listNotification: [NotificationObject]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading, PADDING_LEFT)
            Spacer()
            Image(listNotification.count == 0 ? "iconBell01Nomal" : "iconBell02Active")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding(.trailing, PADDING_LEFT)
        }
        .frame(height: 50)
        .background(Color.clear)
        .padding(.top, UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height)

    }
}

#Preview {
    NavigationHome(listNotification: [])
}
