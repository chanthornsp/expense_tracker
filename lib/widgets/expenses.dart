import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Groceries',
      amount: 100.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Rent',
      amount: 500.0,
      date: DateTime.now(),
      category: Category.rent,
    ),
    Expense(
      title: 'Shoes',
      amount: 50.0,
      date: DateTime.now(),
      category: Category.shopping,
    ),
    Expense(
      title: 'Flight',
      amount: 300.0,
      date: DateTime.now(),
      category: Category.travelling,
    ),
    Expense(
      title: 'Lunch',
      amount: 20.0,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Expenses'),
          const SizedBox(height: 20),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
