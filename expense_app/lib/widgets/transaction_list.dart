import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  const TransactionList({Key? key, required this.transactions, required this.deleteTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isNotEmpty
        ?  ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child:  FittedBox(
                        
                        child: Text(
                            transactions[index].amount.toStringAsFixed(0),
                          ),
                      ),
                    
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(icon: const Icon(Icons.delete) , color: Theme.of(context).errorColor, onPressed: () => deleteTransaction(transactions[index].id)),

                  ),
                );
              },
              itemCount: transactions.length,
            )
        : Container(
          child: Text("No Transaction yet",
              style: Theme.of(context).textTheme.headline5),
        );
  }
}


