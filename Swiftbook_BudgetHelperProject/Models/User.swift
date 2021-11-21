//
//  Model.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 14.11.2021.
//

import Foundation

struct User {
    let name: String
    var account: Double
    var exchange: Exchange
}

extension User {
    enum Exchange: String {
        case dollar = "$"
        case euro =  "€"
        case ruble = "₽"
    }
}

//extension User {
//    static func getData() -> User {
//        let user = User(name: "Richard Gere", account: 12500000, exchange: .ruble)
//        return user
//    }
//}
