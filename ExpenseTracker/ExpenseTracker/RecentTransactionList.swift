//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by AMAR on 26/10/23.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    
    var body: some View {
        VStack{
            HStack{
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                // MARK: Header Link
                NavigationLink{
                    TransactionList()
                }label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            // MARK: Recent Transaction List
            ForEach(Array(transactionListVM.transaction.prefix(5).enumerated()), id: \.element){ index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systembackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color:Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Preview: PreviewProvider{
    
    static let transactionListVM: TransactionListViewModel = {
        let tranactionListVM = TransactionListViewModel()
        tranactionListVM.transaction = transactionListPreviewData
        return tranactionListVM
    }()
    
    static var previews: some View {
        RecentTransactionList()
            .environmentObject(transactionListVM)
    }
}
