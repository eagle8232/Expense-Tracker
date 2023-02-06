//
//  TransactionList.swift
//  Expense Tracker
//
//  Created by Vusal Nuriyev on 1/19/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack {
            List{
                //MARK: Transactions Groups
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key) {
                    month, transactions in
                    Section {
                        //MARK: Transaction List
                        ForEach(transactions) {
                            transactions in
                            TransactionRow(transaction: transactions)
                        }
                    } header: {
                        //MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        NavigationView {
            TransactionList()
        }
        .environmentObject(transactionListVM)
    }
}
