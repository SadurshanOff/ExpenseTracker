//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Sadurshan SP on 06/02/2025.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    init() {
        loadSampleData()
    }
    
    /// Loads some sample transactions for testing
    func loadSampleData() {
        let calendar = Calendar.current
        transactions = [
            Transaction(date: calendar.date(byAdding: .day, value: -4, to: Date())!, amount: 20.0, category: "Food"),
            Transaction(date: calendar.date(byAdding: .day, value: -3, to: Date())!, amount: 50.0, category: "Transport"),
            Transaction(date: calendar.date(byAdding: .day, value: -2, to: Date())!, amount: 100.0, category: "Shopping"),
            Transaction(date: calendar.date(byAdding: .day, value: -1, to: Date())!, amount: 30.0, category: "Food"),
            Transaction(date: Date(), amount: 40.0, category: "Transport")
        ]
    }
    
    /// Adds a new transaction to the list
    func addTransaction(date: Date, amount: Double, category: String) {
        let newTransaction = Transaction(date: date, amount: amount, category: category)
        transactions.append(newTransaction)
    }
}
