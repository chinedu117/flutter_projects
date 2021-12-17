import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown
  ]);
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

class ExpenseApp extends StatefulWidget  {
  ExpenseApp({Key? key}) : super(key: key);

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> transactions = [
    // Transaction(id: 1, title: "New Shoes", amount: 30.0, date: DateTime.now()),
    // Transaction(id: 2, title: "New Shirt", amount: 50.0, date: DateTime.now()),
  ];

  bool _showChart = true;

  void _toggleChart(val){
      
      setState(() {
         _showChart = val;
      });
  }

  void deleteTransaction(int id) {
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

    final mediaQuery = MediaQuery.of(context);
 
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text("Expense App"),
      actions: [
        IconButton(
          onPressed: () => _showAddNewTransaction(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final availableScreenHeight = (mediaQuery.size.height - mediaQuery.padding.top -
                    appBar.preferredSize.height);

    final chartWidget = Container(
            height: isLandscape ? availableScreenHeight * 0.7 :  availableScreenHeight *
                0.3,
            child: Chart(lastWeekTransactions),
          );

    final transListWidget = Container(
            height:  isLandscape ? availableScreenHeight * 0.7 :  availableScreenHeight *
                0.7,
            child: TransactionList(
              transactions: transactions,
              deleteTransaction: deleteTransaction,
            ),
          );

    

    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

           if(!isLandscape) ...[chartWidget,transListWidget],

           if(isLandscape) Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Switch(value: _showChart, onChanged: _toggleChart),
             ],
           ),

           if(isLandscape)  _showChart ? chartWidget : transListWidget,

           
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
