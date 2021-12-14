import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {Key? key,
      required this.weekday,
      required this.amount,
      required this.percentAmountofTotal})
      : super(key: key);

  final String weekday;

  final double amount;

  final double percentAmountofTotal;

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.05, horizontal: 10),
          child: Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.10,
                  child: FittedBox(
                    child: Text(
                      '\$${amount.toStringAsFixed(0)}',
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  width: 10,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(220, 220, 220, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      FractionallySizedBox(
                        heightFactor: percentAmountofTotal,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),

                Container(
                  height: constraints.maxHeight * 0.10,
                  child: Text(weekday))
              ],
          
          ),
        );
      }
    );
  }
}
