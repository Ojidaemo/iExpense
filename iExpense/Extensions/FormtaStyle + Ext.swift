//
//  FormtaStyle + Ext.swift
//  iExpense
//
//  Created by Vitali Martsinovich on 2023-07-27.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
