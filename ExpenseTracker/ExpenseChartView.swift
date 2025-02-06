//
//  ExpenseChartView.swift
//  ExpenseTracker
//
//  Created by Sadurshan SP on 06/02/2025.
//
import SwiftUI
import Charts

struct ExpenseChartView: View {
    @ObservedObject var viewModel: ExpenseViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Chart {
                    ForEach(viewModel.transactions) { transaction in
                        BarMark(
                            x: .value("Date", transaction.date, unit: .day),
                            y: .value("Amount", transaction.amount)
                        )
                        .foregroundStyle(transaction.amount >= 0 ? Color.green : Color.red)
                    }
                }
                .padding()
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day))
                }
                .chartYAxis {
                    AxisMarks()
                }
            }
            .navigationTitle("Expense Chart")
        }
    }
}

struct ExpenseChartView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseChartView(viewModel: ExpenseViewModel())
    }
}

