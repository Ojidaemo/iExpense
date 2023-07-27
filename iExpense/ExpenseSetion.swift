//
//  ExpenseSetion.swift
//  iExpense
//
//  Created by Vitali Martsinovich on 2023-07-27.
//

import SwiftUI

struct ExpenseSetion: View {
    
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    var totalAmount: Double
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.name)
                            .font(.headline)
                        Text(expense.type)
                    }
                    Spacer()
                    Text(expense.amount, format: .localCurrency)
                        .style(for: expense)
                }
            }
            .onDelete(perform: deleteItems)
            HStack {
                Text("Total")
                    .font(.title2.bold())
                Spacer()
                Text(totalAmount, format: .localCurrency)
                    .font(.title2.bold())
            }
        }
    }
}
