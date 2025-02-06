//
//  TransactionListView.swift
//  ExpenseTracker
//
//  Created by Sadurshan SP on 06/02/2025.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var viewModel: ExpenseViewModel
    @State private var showingAddTransaction = false
    
    var body: some View {
        NavigationView {
            List(viewModel.transactions) { transaction in
                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.category)
                        .font(.headline)
                    Text(transaction.date, style: .date)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(String(format: "$%.2f", transaction.amount))
                        .font(.subheadline)
                        .foregroundColor(transaction.amount >= 0 ? .green : .red)
                }
                .padding(.vertical, 4)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Transactions")
            .toolbar {
                Button(action: {
                    showingAddTransaction = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddTransaction) {
                AddTransactionView(viewModel: viewModel)
            }
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: ExpenseViewModel())
    }
}
