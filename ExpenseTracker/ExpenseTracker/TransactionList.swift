//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by AMAR on 26/10/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                //MARK: Transaction Group
                
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key){ month, transactions in
                    Section{
                        //MARK: Transaction List
                        ForEach(transactions){transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        //MARK: Transaction month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct TransactionList_Preview: PreviewProvider{
    
    static let transactionListVM: TransactionListViewModel = {
        let tranactionListVM = TransactionListViewModel()
        tranactionListVM.transaction = transactionListPreviewData
        return tranactionListVM
    }()
    
    static var previews: some View {
        NavigationView{
            TransactionList()
        }
        .environmentObject(transactionListVM)
    }
}

