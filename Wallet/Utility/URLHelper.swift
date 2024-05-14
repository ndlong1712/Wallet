//
//  UrlHelper.swift
//  Wallet
//
//  Created by mac238 on 14/05/2024.
//

import Foundation

struct URLHelper {
    static func urlToFetch(isFirstOpen: Bool, accountType: AccountCurrencyType) -> (String, String, String) {
        var urlSavingAccount = ""
        var urlFixedDepositedAccount = ""
        var urlDigitalAccount = ""
        
        if accountType == .KHR {
            urlSavingAccount = isFirstOpen ? UrlFirstOpenConstant.KhrSavingAccount : UrlPullToRefreshConstant.KhrSavingAccount
            urlFixedDepositedAccount = isFirstOpen ? UrlFirstOpenConstant.KhrFixedDepositedAccount : UrlPullToRefreshConstant.KhrFixedDepositedAccount
            urlDigitalAccount = isFirstOpen ? UrlFirstOpenConstant.KhrDigitalAccount : UrlPullToRefreshConstant.KhrDigitalAccount
        } else if accountType == .USD {
            urlSavingAccount = isFirstOpen ? UrlFirstOpenConstant.UsdSavingAccount : UrlPullToRefreshConstant.UsdSavingAccount
            urlFixedDepositedAccount = isFirstOpen ? UrlFirstOpenConstant.UsdFixedDepositedAccount : UrlPullToRefreshConstant.UsdFixedDepositedAccount
            urlDigitalAccount = isFirstOpen ? UrlFirstOpenConstant.UsdDigitalAccount : UrlPullToRefreshConstant.UsdDigitalAccount
        }
        return (urlSavingAccount, urlFixedDepositedAccount, urlDigitalAccount)
    }
}
