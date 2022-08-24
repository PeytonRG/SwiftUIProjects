//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Peyton Gasink on 8/23/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
