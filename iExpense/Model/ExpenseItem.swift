//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Vitali Martsinovich on 2023-07-27.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
