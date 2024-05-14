//
//  Account.swift
//  Wallet
//
//  Created by mac238 on 12/05/2024.
//

import Foundation

enum AccountType {
    case USD
    case KHR
}

class Account: Codable, Identifiable {
    var account: String = ""
    var curr: String = ""
    var balance: Double = 0
}

protocol BankAccount {
    func summaryBalance() -> Double
}

class SavingAccountResponseModel: Codable, BankAccount {
    var savingsList: [Account] = []
    
    enum CodingKeys: String, CodingKey {
        case savingsList
    }
    
    func summaryBalance() -> Double {
        return savingsList.reduce(0.0) { partialResult, account in
            return partialResult + account.balance
        }
    }
}

class FixedDepositedAccountResponseModel: Codable, BankAccount {
    var fixedDepositList: [Account] = []
    
    enum CodingKeys: String, CodingKey {
        case fixedDepositList
    }
    
    func summaryBalance() -> Double {
        return fixedDepositList.reduce(0.0) { partialResult, account in
            return partialResult + account.balance
        }
    }
}

class DigitalAccountResponseModel: Codable, BankAccount {
    var digitalList: [Account] = []
    
    enum CodingKeys: String, CodingKey {
        case digitalList
    }
    
    func summaryBalance() -> Double {
        return digitalList.reduce(0.0) { partialResult, account in
            return partialResult + account.balance
        }
    }
}
