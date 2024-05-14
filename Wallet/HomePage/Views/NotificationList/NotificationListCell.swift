//
//  NotificationListCell.swift
//  Wallet
//
//  Created by mac238 on 13/05/2024.
//

import SwiftUI

struct NotificationListCell: View {
    var notificationItem: NotificationObject
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .frame(width: 12)
                    .foregroundColor(notificationItem.status ? .clear : .wallet.primaryTone)
                Text(notificationItem.title)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.leading, -3)
                    .foregroundColor(.wallet.black)
                Spacer()
            }
            Text(notificationItem.updateDateTime)
                .font(.system(size: 14, weight: .regular))
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .foregroundColor(.wallet.grayDark)
            Text(notificationItem.message)
                .font(.system(size: 16, weight: .regular))
                .padding(.leading, 16)
                .padding(.trailing, 0)
                .foregroundColor(.wallet.gray)
            Spacer()
        }
    }
}

#Preview {
    NotificationListCell(notificationItem: NotificationObject())
}
