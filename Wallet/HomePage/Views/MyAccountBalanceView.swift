//
//  MyAccountBalanceView.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI

struct MyAccountBalanceView: View {
    @Binding var isShowingBalance: Bool
    var summaryUsdBlance: Double?
    var summaryKhrBlance: Double?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("My Account Balance")
                    .font(.system(size: 18, weight: .heavy))
                    .foregroundColor(.wallet.gray)
                Image(isShowingBalance ? "iconEye01On" : "iconEye02Off")
                    .frame(width: 24, height: 24)
                Spacer()
            }
            .onTapGesture {
                isShowingBalance.toggle()
            }
            Text("USD")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.wallet.grayDark)
                .padding(.top, 5)
            if let usdBalance = summaryUsdBlance {
                Text(isShowingBalance ? usdBalance.formatCurrency() : "********")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.wallet.black)
            } else {
                ShimmerEffectBox()
                    .frame(height: 32)
                    .padding(.trailing, 24)
            }
            Text("KHR")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.wallet.grayDark)
                .padding(.top, 1)
            if let khrBalance = summaryKhrBlance {
                Text(isShowingBalance ? khrBalance.formatCurrency() : "********")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.wallet.black)
            } else {
                ShimmerEffectBox()
                    .frame(height: 32)
                    .padding(.trailing, 24)
                
            }
        }
        .padding(.leading, PADDING_LEFT)
    }
}

#Preview {
    MyAccountBalanceView(isShowingBalance: .constant(true), summaryUsdBlance: 10, summaryKhrBlance: 10)
}
