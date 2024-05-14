//
//  AdBanner.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI


struct AdBanner: View {
    @State var bannerIndex: Int = 0
    var pages: [Banner]
    var dotAppearance = UIPageControl.appearance()
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            if pages.count == 0 {
                ShimmerEffectBox()
                    .frame(height: 88)
                PageControlCustom(currentPage: $bannerIndex, numberOfPages: 3)
            } else {
                TabView(selection: $bannerIndex)  {
                    ForEach(pages, id: \.adSeqNo) { page in
                        ZStack {
                            AsyncImage(url: URL(string: page.linkUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                ShimmerEffectBox()
                                    .frame(height: 88)
                            }
                        }
                        .tag(page.adSeqNo - 1)
                    }
                }
                .frame(height: 88)
                .animation(.easeOut, value: bannerIndex)
                .cornerRadius(12)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                .onReceive(timer, perform: { _ in
                    if bannerIndex == pages.count - 1 {
                        bannerIndex = 0
                    } else {
                        bannerIndex += 1
                    }
                })
                if pages.count > 1 {
                    PageControlCustom(currentPage: $bannerIndex, numberOfPages: pages.count)
                }
            }
            Spacer()
        }
        .frame(height: 150)
        .onAppear(perform: {

        })
    }
}

#Preview {
    AdBanner(pages: [])
}



