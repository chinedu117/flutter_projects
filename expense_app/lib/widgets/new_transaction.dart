import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({Key? key, required this.addTransaction}) : super(key: key);

  final Function addTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController amountController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  var _chosenDate;

  void submitData() {
    if (amountController.text.isEmpty ||
        titleController.text.isEmpty ||
        _chosenDate == null) {
      return;
    }

    widget.addTransaction(
        titleController.text, double.parse(amountController.text), _chosenDate);

    Navigator.of(context).pop();
  }

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        _chosenDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            left:10,
            right:10,
            top: 10,
            bottom: (MediaQuery.of(context).viewInsets.bottom + 10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => submitData(),
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                decoration: const InputDecoration(
                  labelText: "Amount",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _chosenDate == null
                            ? "No chosen date !"
                            : DateFormat.yMd().format(_chosenDate),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _selectDate,
                      child: const Text('Select Date'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => submitData(),
                child: const Text('Add Expense'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
