import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
    //@required this.editTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;
  //final Function editTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Color.fromARGB(255, 112, 160, 244),
      Color.fromARGB(255, 20, 88, 119),
      Color.fromARGB(255, 112, 141, 165),
      Color.fromARGB(255, 0, 170, 255),
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(child: Text('${widget.transaction.amount} руб.')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(DateFormat.yMMMMd().format(widget.transaction.date)),
        trailing: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.edit),
                color: Theme.of(context).focusColor,
                onPressed: () => {} //widget.editTx(widget.transaction.id),
                ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => widget.deleteTx(widget.transaction.id),
            ),
          ],
        ),
      ),
    );
  }
}
