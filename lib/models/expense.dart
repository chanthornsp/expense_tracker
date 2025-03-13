import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final intl = DateFormat('dd/MM/yyyy');
const uuid = Uuid();

enum Category {
  food,
  travelling,
  shopping,
  rent,
  entertainment,
  transport,
  health,
  bills,
  other,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travelling: Icons.flight,
  Category.shopping: Icons.shopping_cart,
  Category.rent: Icons.home,
  Category.entertainment: Icons.movie,
  Category.transport: Icons.directions_bus,
  Category.health: Icons.local_hospital,
  Category.bills: Icons.receipt,
  Category.other: Icons.category,
};

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

  String get formattedDate => intl.format(date);
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses =
          allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  // getter
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
