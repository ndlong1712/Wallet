//
//  HomePageViewModel.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import Foundation
import Combine


class HomePageViewModel: ObservableObject  {
    @Published var utilities: [UtilityItem] = [
        UtilityItem(icon: "ElementMenuTransfer", title: "Transfer"),
        UtilityItem(icon: "ElementMenuPayment", title: "Payment"),
        UtilityItem(icon: "ElementMenuUtility", title: "Utility"),
        UtilityItem(icon: "ElementScan", title: "QR pay scan"),
        UtilityItem(icon: "ElementMenuQRcode", title: "My QR code"),
        UtilityItem(icon: "ElementMenuTopUp", title: "Top up")
    ]
    var firstLoadPage = true
    @Published var listNotification: [NotificationObject] = []
    @Published var favorites: [FavoriteItem] = []
    @Published var adBanner:[Banner] = []
    @Published var loading: Bool = false
    
    @Published var summaryUsdBalance: Double?
    @Published var summaryKhrBalance: Double?
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetchBanner() {
        APIService.shared.fetchDataWithCombine(for: BannerResponseModel.self, url: UrlFirstOpenConstant.BannerAd)
            .delay(for: 2, scheduler: DispatchQueue.main) // API call so fast so add 2s delay to see the loading
            .sink { model in
                // handle UI here
            } receiveValue: {[weak self] model in
                guard let strongSelf = self,
                      let bannerModel = model.result else {return}
                strongSelf.adBanner = bannerModel.bannerList
            }
            .store(in: &cancellables)
    }
    
    func fetchNotificationList(isFirstOpen: Bool) {
        let url = isFirstOpen ? UrlFirstOpenConstant.Notification : UrlPullToRefreshConstant.Notification
        APIService.shared.fetchDataWithCombine(for: NotificationResponseModel.self, url: url)
            .receive(on: DispatchQueue.main)
            .sink { model in
                // handle UI here
            } receiveValue: {[weak self] model in
                guard let strongSelf = self,
                      let noties = model.result else {return}
                strongSelf.listNotification = noties.messages
                
            }
            .store(in: &cancellables)
    }
    
    func fetchFavoriteList(isFirstOpen: Bool) {
        let url = isFirstOpen ? UrlFirstOpenConstant.Farorite : UrlPullToRefreshConstant.Farorite
        APIService.shared.fetchDataWithCombine(for: FavoriteResponseModel.self, url: url)
            .receive(on: DispatchQueue.main)
            .sink { model in
                // handle UI here
            } receiveValue: {[weak self] model in
                guard let strongSelf = self,
                      let favorite = model.result else {return}
                strongSelf.favorites = favorite.favoriteList
            }
            .store(in: &cancellables)
    }
    
    func accountObservables(isFirstOpen: Bool, type: AccountCurrencyType) {
        let urls = URLHelper.urlToFetch(isFirstOpen: isFirstOpen, accountType: type)
        let fetchSavingAccount = APIService.shared.fetchDataWithCombine(for: SavingAccountResponseModel.self, url: urls.0)
            .map { $0.result?.summaryBalance() }
        let fetchFixedDepositedAccount = APIService.shared.fetchDataWithCombine(for: FixedDepositedAccountResponseModel.self, url: urls.1)
            .map { $0.result?.summaryBalance() }
        let fetchDigitalAccount = APIService.shared.fetchDataWithCombine(for: DigitalAccountResponseModel.self, url: urls.2)
            .map { $0.result?.summaryBalance() }
        
        Publishers.CombineLatest3(fetchSavingAccount, fetchFixedDepositedAccount, fetchDigitalAccount)
            .delay(for: isFirstOpen ? 2 : 1, scheduler: DispatchQueue.main)
            .sink { model in
                self.loading = false
            } receiveValue: {[weak self] models in
                guard let strongSelf = self else {return}
                let summary = (models.0 ?? 0) + (models.1 ?? 0) + (models.2 ?? 0)
                print("summaryy = \(summary)")
                if isFirstOpen {
                    strongSelf.firstLoadPage = false
                }
                if type == .KHR {
                    strongSelf.summaryKhrBalance = summary
                } else {
                    strongSelf.summaryUsdBalance = summary
                }
            }
            .store(in: &cancellables)
    }
    
    
}

