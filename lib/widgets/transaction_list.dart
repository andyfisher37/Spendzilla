import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Нет транзакций!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/notrans.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('${transactions[index].amount} руб.')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
