import 'package:expenses/models/transaction_type.dart';
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final TransactionType type;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.type,
    @required this.date,
  });
}
