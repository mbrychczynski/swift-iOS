//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Mateusz Brychczynski on 24/04/2023.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
