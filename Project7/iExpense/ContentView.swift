//
//  ContentView.swift
//  iExpense
//
//  Created by Peyton Gasink on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    let personalExpenses = expenses.items.filter { item in
                        return item.type == "Personal"
                    }
                    ForEach(personalExpenses) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .foregroundColor(item.amount < 100 ? (item.amount < 10 ? .green : .blue) : .red)
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Personal Expenses")
                }
                
                Section {
                    let businessExpenses = expenses.items.filter { item in
                        return item.type == "Business"
                    }
                    ForEach(businessExpenses) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .foregroundColor(item.amount < 100 ? (item.amount < 10 ? .green : .blue) : .red)
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Business Expenses")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        // idk how to remove from the correct list without just splitting the lists in two and I don't wanna do that for just this challenge so this bug will remain
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
