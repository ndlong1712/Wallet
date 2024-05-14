//
//  UtilityView.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI

struct UtilityItem: Hashable {
    var icon: String
    var title: String
}

struct UtilityView: View {
    var utilities: [UtilityItem]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(utilities, id: \.self) { item in
                GenericItemView(content:
                                    Text(item.title)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.wallet.grayDark)
                                    , icon: item.icon)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UtilityView(utilities: [
        UtilityItem(icon: "ElementMenuTransfer", title: "Transfer"),
        UtilityItem(icon: "ElementMenuPayment", title: "Payment"),
        UtilityItem(icon: "ElementMenuUtility", title: "Utility"),
        UtilityItem(icon: "ElementScan", title: "QR pay scan"),
        UtilityItem(icon: "ElementMenuQRcode", title: "My QR code"),
        UtilityItem(icon: "ElementMenuTopUp", title: "Top up")
    ])
}



struct GenericItemView<T:View>: View {
    let content: T
    let icon: String
    
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
            content
        }
    }
}

#Preview {
    GenericItemView(content:
                        Text("Transfer")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.wallet.grayDark), icon: "ElementMenuTransfer")
//    UtilityItemView(item: UtilityItem(icon: "ElementMenuTransfer", title: "Transfer"))
}
