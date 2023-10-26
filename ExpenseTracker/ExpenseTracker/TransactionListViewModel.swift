//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by AMAR on 26/10/23.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject {
    @Published var transaction: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        getTransaction()
    }
    
    func getTransaction(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data,response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
                switch completion{
                case .failure(let error):
                    print("Error fetching transactions:", error.localizedDescription)
                    
                case .finished:
                    print("finshed fetching transaction")
                }
                
            } receiveValue: { [weak self] result in
                self?.transaction = result
                dump(self?.transaction)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transaction.isEmpty else { return [:]}
        
        let groupTransactions = TransactionGroup(grouping: transaction) { $0.month }
        return groupTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        print("accumulateTransactions")
        guard !transaction.isEmpty else { return []}
        let today = "10/26/2023".dateParsed()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval--\(dateInterval)")
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transaction.filter{ $0.dateParsed == date && $0.isExpense}
            let dailyTotal = dailyExpenses.reduce(0){ $0 - $1.signedAmount}
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
            print(date.formatted(), "dailyTotal", dailyTotal, "sum", sum)
        }
        
        return cumulativeSum
    }
}
