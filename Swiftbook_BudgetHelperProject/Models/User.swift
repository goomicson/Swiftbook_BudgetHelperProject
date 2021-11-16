//
//  Model.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 14.11.2021.
//

import Foundation

struct User {
    let name: String
    let account: Double
}

extension User {
    static func getData() -> User {
        let user = User(name: "Richard Gere", account: 12500000)
        return user
    }
}
