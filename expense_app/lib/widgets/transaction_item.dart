
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "../models/transaction.dart";

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  
  Color? _avatarBgColor;

  @override
  void initState() {
    
    super.initState();
    final colors = [Colors.purple, Colors.black, Colors.yellow, Colors.red ];

    _avatarBgColor = colors[Random().nextInt(colors.length - 1)];

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _avatarBgColor,
          child:  FittedBox(
            
            child: Text(
                widget.transaction.amount.toStringAsFixed(0),
              ),
          ),
        
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
      trailing: IconButton(icon: const Icon(Icons.delete) , color: Theme.of(context).errorColor, onPressed: () => widget.deleteTransaction(widget.transaction.id)),

      ),
    );
  }
}