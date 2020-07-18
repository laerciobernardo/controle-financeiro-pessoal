import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TransactionType {
  final String id;
  final String titulo;
  final bool despesa;
  final Icon ico;

  TransactionType({
    @required this.id,
    @required this.titulo,
    @required this.despesa,
    @required this.ico,
  });
}
