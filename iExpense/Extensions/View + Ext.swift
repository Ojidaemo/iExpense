//
//  View + Ext.swift
//  iExpense
//
//  Created by Vitali Martsinovich on 2023-07-27.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        switch item.amount {
        case ..<10:
            return self.font(.body)
        case 10..<100:
            return self.font(.title3)
        default:
            return self.font(.title)
        }
    }
}
