//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by AMAR on 26/10/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var demoData:[Double] = [8, 2, 4, 6, 12, 9, 2]
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Line chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading){
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }
                                .background(Color.systembackground)
                                
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systembackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 300)
                    }
                    
                
                    
                    //MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.backgroundC)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.iconC, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}


struct ContentView_Preview: PreviewProvider{
    
    static let transactionListVM: TransactionListViewModel = {
        let tranactionListVM = TransactionListViewModel()
        tranactionListVM.transaction = transactionListPreviewData
        return tranactionListVM
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
}



