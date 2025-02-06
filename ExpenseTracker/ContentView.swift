//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Sadurshan SP on 06/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    
    var body: some View {
        TabView {
            TransactionListView(viewModel: viewModel)
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
            ExpenseChartView(viewModel: viewModel)
                .tabItem {
                    Label("Charts", systemImage: "chart.bar.xaxis")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
