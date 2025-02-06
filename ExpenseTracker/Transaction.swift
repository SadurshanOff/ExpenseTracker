//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by Sadurshan SP on 06/02/2025.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Double
    let category: String
}
