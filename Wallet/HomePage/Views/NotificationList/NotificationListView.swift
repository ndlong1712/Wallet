//
//  NotificationListView.swift
//  Wallet
//
//  Created by mac238 on 12/05/2024.
//

import SwiftUI



struct NotificationListView: View {
    var listItem: [NotificationObject]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            //MARK: NAVIGATION
            HStack() {
                Image("iconArrowWTailBack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 48)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text("Notification")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color.wallet.black)
                    .padding(.trailing, 54)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 48)
            
            //MAKR: LIST
            List(0..<listItem.count, id: \.self) { i in
                NotificationListCell(notificationItem: listItem[i])
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            Spacer()
        }
        .padding(.top, UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height)
        .ignoresSafeArea()
    }
}

#Preview {
    NotificationListView(listItem: [NotificationObject()])
}
