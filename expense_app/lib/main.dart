import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:expense_app/models/transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpenseApp(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline2: const TextStyle(fontSize: 18),
            ),
      ),
    );
  }
}

class ExpenseApp extends StatefulWidget {
  ExpenseApp({Key? key}) : super(key: key);

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> transactions = [
    // Transaction(id: 1, title: "New Shoes", amount: 30.0, date: DateTime.now()),
    // Transaction(id: 2, title: "New Shirt", amount: 50.0, date: DateTime.now()),
  ];

  void deleteTransaction(int id){
     setState(() {
        transactions.removeWhere((element) => element.id == id);
     });
  }

  List<Transaction> get lastWeekTransactions {
    final lastWeek = DateTime.now().subtract(const Duration(days: 7));

    return transactions.where((element) {
      return element.date.isAfter(lastWeek);
    }).toList();
  }

  void _showAddNewTransaction(BuildContext _context) {
    showModalBottomSheet(
      context: _context,
      builder: (_) {
        return NewTransaction(
          addTransaction: _addTransaction,
        );
      },
    );
  }

  void _addTransaction(String title, double amount, DateTime chosenDate) {
    final nextCount = transactions.length + 1;

    final trans = Transaction(
        id: nextCount, amount: amount, title: title, date: chosenDate);

    setState(() {
      transactions.add(trans);
    });
  }

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
        title: const Text("Expense App"),
        actions: [
          IconButton(
            onPressed: () => _showAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      );

    return Scaffold(
      appBar: appBar,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Chart(lastWeekTransactions),
          TransactionList(
            transactions: transactions,
            deleteTransaction: deleteTransaction,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddNewTransaction(context),
      ),
    );
  }
}
