import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.lastWeekTransactions, {Key? key}) : super(key: key);

  final List<Transaction> lastWeekTransactions;

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var amountTotal = 0.0;
      for (var i = 0; i < lastWeekTransactions.length; i++) {
        if (lastWeekTransactions[i].date.day == weekday.day &&
            lastWeekTransactions[i].date.year == weekday.year &&
            lastWeekTransactions[i].date.month == weekday.month) {
          amountTotal += lastWeekTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': amountTotal
      };
    }).reversed.toList();
  }

  double get totalTransactionAmount {
      
      return groupedTransactions.fold(0.0, (previousValue, element) {

            return previousValue += element['amount'];
      });
    }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((summary) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              weekday: summary['day'],
              amount: summary['amount'],
              percentAmountofTotal:  totalTransactionAmount == 0.0 ? 0.0 : summary['amount'] / totalTransactionAmount,
            ),
          );
        }).toList(),
      ),
    );
  }
}
