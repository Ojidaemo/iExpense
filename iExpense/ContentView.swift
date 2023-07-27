//
//  ContentView.swift
//  iExpense
//
//  Created by Vitali Martsinovich on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    private var totalAmountBusiness: Double {
        totalAmount(in: expenses.businessItems)
    }
    private var totalAmountPersonal: Double {
        totalAmount(in: expenses.personalItems)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSetion(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems, totalAmount: totalAmountBusiness)
                ExpenseSetion(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems, totalAmount: totalAmountPersonal)
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            //showing another view
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    //MARK: - Methods
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
    
    
    func totalAmount(in inputArray: [ExpenseItem]) -> Double {
        var sum: Double = 0.0
        for item in inputArray {
            sum += item.amount
        }
        return sum
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
