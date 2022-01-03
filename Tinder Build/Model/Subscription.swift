//
//  Subscription.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/03.
//

import Foundation

struct Subscription: Identifiable {
    let id = UUID()
    
    var durationInMonths: Int
    var monthlyCost: Double
    var totalCost: Double
    var savePercent: Int?
    var tagLine: TagLine = .none
    
    // MARK: For different currencies
//    var subscriptionPriceText: String {
//        
//    }
    
    enum TagLine: String {
        case mostPopular = "MOST POPULAR"
        case bestValue = "BEST VALUE"
        case none
    }
}

extension Subscription {
    static let example1 = Subscription(
        durationInMonths: 6,
        monthlyCost: 15.00,
        totalCost: 89.99,
        savePercent: 50,
        tagLine: .bestValue
    )
    static let example2 = Subscription(
        durationInMonths: 3,
        monthlyCost: 20.00,
        totalCost: 59.99,
        savePercent: 3,
        tagLine: .mostPopular
    )
    static let example3 = Subscription(
        durationInMonths: 1,
        monthlyCost: 29.99,
        totalCost: 29.99
    )
}
