//
//  View-ExpenseStyling.swift
//  iExpense
//
//  Created by Mateusz Brychczynski on 24/04/2023.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
