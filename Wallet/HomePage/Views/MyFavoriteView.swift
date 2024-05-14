//
//  MyFavoriteView.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI


struct MyFavoriteView: View {
    var listFavorites: [FavoriteItem]
    
    var body: some View {
        VStack {
            HStack {
                Text("My Favourite")
                    .font(.system(size: 18, weight: .heavy))
                    .foregroundColor(.wallet.gray)
                Spacer()
                HStack(spacing: 2) {
                    Text("More")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.wallet.grayDark)
                    Image("iconArrow01Next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing, 16)
            }
            .padding(.leading, PADDING_LEFT)
            if listFavorites.count == 0 {
                HStack(spacing: 12) {
                    VStack(alignment: .center) {
                        Image("ElementScrollEmpty")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56)
                        Text("- - -")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.wallet.gray)
                    }
                    .padding(.leading, 36)
                    Text("You can add a favorite through the transfer or payment function.")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.wallet.gray)
                    .padding(.top, -15)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 25)
                }
                
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(listFavorites, id: \.id) { item in
                            GenericItemView(content:
                                                Text(item.transType)
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.wallet.gray)
                                                , icon: item.iconName())
                            .padding(.trailing, 28)
                            .padding(.leading, 5)
                            .rotationEffect(Angle(degrees: 0)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                        }
                    }
                }
                .scrollDisabled(!(listFavorites.count > 4))
                .rotationEffect(Angle(degrees: 0)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
            }
        }
    }
}

#Preview {
    MyFavoriteView(listFavorites: [

    ])
}

