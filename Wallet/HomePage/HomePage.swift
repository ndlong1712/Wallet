//
//  ContentView.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI

struct HomePageView: View {
    @State var tabSelection: TabbarItem = .home
    @State var isShowingBalance: Bool = true
    
    @ObservedObject var viewModel: HomePageViewModel
    @State private var stackPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            CustomTabbarContainerView(selection: $tabSelection) {
                LoadingView(isShowing: viewModel.loading) {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack() {
                            NavigationHome(listNotification: viewModel.listNotification)
                                .onTapGesture {
                                    if viewModel.listNotification.count > 0 {
                                        stackPath.append("ListNotification")
                                    }
                                }
                            MyAccountBalanceView(isShowingBalance: $isShowingBalance, summaryUsdBlance: viewModel.summaryUsdBalance, summaryKhrBlance: viewModel.summaryKhrBalance)
                            UtilityView(utilities: viewModel.utilities)
                                .padding(.top, 12)
                            MyFavoriteView(listFavorites: viewModel.favorites)
                                .padding(.top, 20)
                            AdBanner(pages: viewModel.adBanner)
                                .padding(EdgeInsets(top: 20, leading: PADDING_LEFT, bottom: 50, trailing: PADDING_LEFT))
                            Spacer()
                        }
                    }
                }
                .refreshable {
                    let _ = print("fetch data...!")
                    viewModel.loading = true
                    viewModel.accountObservables(isFirstOpen: false, type: .KHR)
                    viewModel.accountObservables(isFirstOpen: false, type: .USD)
                    viewModel.fetchFavoriteList(isFirstOpen: false)
                    viewModel.fetchNotificationList(isFirstOpen: false)
                    if viewModel.adBanner.count == 0 {
                        viewModel.fetchBanner()
                    }
                }
                .tabbarItem(tab: .home, selection: $tabSelection)
                .onAppear(perform: {
                    print("ON APPEAR")
                    viewModel.fetchBanner()
                    viewModel.accountObservables(isFirstOpen: viewModel.firstLoadPage, type: .KHR)
                    viewModel.accountObservables(isFirstOpen: viewModel.firstLoadPage, type: .USD)
                    viewModel.fetchFavoriteList(isFirstOpen: true)
                    viewModel.fetchNotificationList(isFirstOpen: true)
                })
                .navigationDestination(for: String.self) { value in
                    NotificationListView(listItem: viewModel.listNotification)
                        .hiddenNavigationBarStyle()
                }
                Color.blue
                    .tabbarItem(tab: .account, selection: $tabSelection)
                Color.orange
                    .tabbarItem(tab: .location, selection: $tabSelection)
                Color.green
                    .tabbarItem(tab: .service, selection: $tabSelection)
            }
        }
    }
}

#Preview {
    HomePageView(viewModel: HomePageViewModel())
}

