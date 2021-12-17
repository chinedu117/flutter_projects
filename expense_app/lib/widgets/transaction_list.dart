import 'package:flutter/material.dart';

import './transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isNotEmpty
        ? ListView(
            children: transactions.map((trans){

              return TransactionItem(
                  key: ValueKey(trans.id),
                  transaction: trans,
                  deleteTransaction: deleteTransaction);
            }).toList(),
          
          )
        : Container(
            child: Text("No Transaction yet",
                style: Theme.of(context).textTheme.headline5),
          );
  }
}