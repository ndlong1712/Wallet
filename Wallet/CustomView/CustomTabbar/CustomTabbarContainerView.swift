//
//  CustomTabbarContainerView.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI


struct CustomTabbarContainerView<Content: View>: View {
    let content: Content
    @Binding var selection: TabbarItem
    @State private var tabs: [TabbarItem] = []
    
    init(selection: Binding<TabbarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabbarView(tabs: tabs, selection: $selection)
        }
        .padding(.bottom, 30)
        .ignoresSafeArea()
        .onPreferenceChange(TabbarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabbarContainerView_Previews: PreviewProvider {
    static let tabs: [TabbarItem] = [
        .home, .account, .location, .service
    ]
    static var previews: some View {
        CustomTabbarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
