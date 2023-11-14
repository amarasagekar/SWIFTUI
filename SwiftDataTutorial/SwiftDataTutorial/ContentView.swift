//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by AMAR on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @State private var expenseToEdit: Expanse?
    
    //To fetch all record
    //@Query(sort: \Expanse.date) var expanses:[Expanse]
    
    //Filter while fetching records
    @Query(filter: #Predicate<Expanse>{$0.value > 1000}, sort: \Expanse.date)var expanses:[Expanse]
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(expanses) { expanse in
                    ExpanseCell(expense: expanse)
                        .onTapGesture {
                            expenseToEdit = expanse
                        }
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        context.delete(expanses[index])
                    }
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet){
                AddExpenseSheet()
            }
            .sheet(item: $expenseToEdit){ expense in
                UpdateExpanseSheet(expense: expense)
            }
            .toolbar{
                if !expanses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                    
                }
            }
            .overlay {
                if expanses.isEmpty {
                    ContentUnavailableView(label:{
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start Adding expenses to see your list.")
                    }, actions: {
                        Button("Add Expense"){ isShowingItemSheet = true}
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ExpanseCell: View {
    let expense: Expanse
    
    var body: some View{
        HStack{
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "USD"))
        }
    }
    
}

struct AddExpenseSheet: View{
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View{
        NavigationStack{
            Form{
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading){
                    Button("Cancel"){dismiss()}
                }
                
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Save"){
                    // Save code goes here
                        let expense = Expanse(name: name, date: date, value: value)
                        context.insert(expense)
                        
                        try! context.save()
                        dismiss()
                        
                    }
                }
            }
        }
    }
}


struct UpdateExpanseSheet: View{
    
    @Environment(\.dismiss) private var dismiss
    
    
    @Bindable var expense: Expanse
    
    var body: some View{
        NavigationStack{
            Form{
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Done"){dismiss()}
                }
            }
        }
    }
}
