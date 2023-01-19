import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercent;

  ChartBar(this.label, this.spendingAmount, this.spendingPercent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spendingAmount > 0
            ? FittedBox(
                child: Text('${spendingAmount.toStringAsFixed(0)} руб.'))
            : Text(''),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 20,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPercent,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        FittedBox(child: Text(label)),
      ],
    );
  }
}
