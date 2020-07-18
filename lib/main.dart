import 'package:expenses/models/transaction.dart';
import 'package:expenses/models/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

main() {
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final loadedTime = new DateTime.now();
  static final _transactionTypes = [
    TransactionType(
        id: 'tt1',
        titulo: 'Receitas',
        despesa: false,
        ico: Icon(
          Icons.attach_money,
          color: Colors.green[300],
        )),
    TransactionType(
        id: 'tt2',
        titulo: 'Compras',
        despesa: true,
        ico: Icon(
          Icons.shopping_basket,
          color: Colors.blueAccent,
          size: 20.0,
        )),
    TransactionType(
        id: 'tt3',
        titulo: 'Mercado',
        despesa: true,
        ico: Icon(
          Icons.shopping_cart,
          color: Colors.amber[300],
        )),
    TransactionType(
        id: 'tt4',
        titulo: 'Assinaturas e serviços',
        despesa: true,
        ico: Icon(
          Icons.subscriptions,
          color: Colors.red[300],
          size: 20.0,
        )),
  ];

  final _transactions = [
    Transaction(
      id: "t1",
      title: 'Teclado ErgoDox',
      value: 1500.11,
      type: _transactionTypes[1],
      date: DateTime.now().subtract(new Duration(days: 3)),
    ),
    Transaction(
      id: "t2",
      title: 'Compras do mês - Assaí',
      value: 541.17,
      type: _transactionTypes[2],
      date: DateTime.now().subtract(new Duration(days: 32)),
    ),
    Transaction(
      id: "t3",
      title: 'Netflix',
      value: 32.90,
      type: _transactionTypes[3],
      date: DateTime.now().subtract(new Duration(days: 18)),
    ),
    Transaction(
      id: "t4",
      title: 'Salário',
      value: 2474.81,
      type: _transactionTypes[0],
      date: DateTime.now(),
    ),
  ];

  final _currencyFormat =
      new NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  final _dateFormat = new DateFormat('d MMM y HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              final now = new DateTime.now();
              final difference = new DateTime.now().difference(tr.date);
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: tr.type.despesa ? Colors.red : Colors.green,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '${_currencyFormat.format(tr.value)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color:
                                  tr.type.despesa ? Colors.red : Colors.green),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            // _dateFormat.format(tr.date),
                            timeago.format(now.subtract(difference),
                                locale: 'pt_BR'),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: tr.type.ico,
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
