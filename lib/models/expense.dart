import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travelling, shopping, rent, other }

class Expense {
  // initialize value for id when this class is called
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
