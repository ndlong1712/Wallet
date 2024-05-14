//
//  CustomTabbarView.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI



struct CustomTabbarView: View {
    let tabs: [TabbarItem]
    @Binding var selection: TabbarItem
    @Namespace private var nameSpace
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .frame(height: 50)
        .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(35)
        .shadow(color: .black.opacity(0.2),radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0, y: 5)
        .padding(.horizontal, 24)
    }
}

struct CustomTabbarView_Previews: PreviewProvider {
    static let tabs: [TabbarItem] = [
        .home, .account, .location, .service
    ]
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabbarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}

extension CustomTabbarView {
    private func tabView(tab: TabbarItem) -> some View {
        VStack {
            if tab.iconName.contains("icTabbar") {
                Image(tab.iconName)
            } else {
                Image(systemName: tab.iconName)
                    .frame(width: 21, height: 21)
            }
            Text(tab.title)
                .font(.system(size: 12, weight: .semibold))
        }
        .foregroundColor(selection == tab ? tab.color : .gray)
        
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(
            ZStack {
                if selection == tab {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(tab.color.opacity(0.2))
                        .frame(width: 25, height: 10)
                        .matchedGeometryEffect(id: "background_rectangle", in: nameSpace)
                }
            }
        )
    }
    
    private func switchToTab(tab: TabbarItem) {
        withAnimation {
            selection = tab
        }
    }
}


