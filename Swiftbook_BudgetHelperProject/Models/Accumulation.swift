//
//  Accumulation.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Shevshelev Lev on 15.11.2021.
//

import Foundation

struct Accumulation {
    let name: String
    let totalAmount: Double
    let dayOfProfit: Date
    
    var duration: Int
    var exchange: Exchange
    var currentAmount: Double = 0
    
    var percent: Double {
        round(currentAmount / totalAmount * 100)
    }
    var monthlyPayment: Double {
        totalAmount / Double(duration)
    }
}

extension Accumulation {
    enum Exchange {
        case dollar
        case euro
        case ruble
    }
}

extension Accumulation {
    static func getData() -> [Accumulation] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yy"
        let dateString = ["09.09.21", "09.12.21", "09.01.22"]
        
        var dates: [Date] = []
        
        for date in dateString {
            if let formattedDate = dateFormatter.date(from: date) {
                dates.append(formattedDate)
            }
        }
        let accumulations = [Accumulation(name: "First Accumulation", totalAmount: 100000, dayOfProfit: dates[0], duration: 12, exchange: .ruble, currentAmount: 50),
                             Accumulation(name: "Second Accumulation", totalAmount: 18000, dayOfProfit: dates[1], duration: 15, exchange: .dollar),
                             Accumulation(name: "Third", totalAmount: 1000000, dayOfProfit: dates[2], duration: 120, exchange: .euro, currentAmount: 2)]
        return accumulations
    }
}
