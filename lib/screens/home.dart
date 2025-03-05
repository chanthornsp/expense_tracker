import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_form.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  void _openAddExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => ExpenseForm(onAddExpense: _addExpense),
    );
  }

  // add new expense to the list
  void _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });

    // show toast message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense added successfully'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // remove expense from the list
  void _removeExpense(Expense expense) {
    // get index of the expense
    final expenseIndex = expenses.indexWhere((e) => e.id == expense.id);

    setState(() {
      expenses.remove(expense);
    });
    // clear Snackbar
    ScaffoldMessenger.of(context).clearSnackBars();
    // show undo snackbar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense on ${expense.category.name} removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenses.insert(expenseIndex, expense);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        expenses.isEmpty
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.money_off, size: 100, color: Colors.grey),
                  const SizedBox(height: 20),
                  const Text(
                    'No expenses added yet',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
            : ExpensesList(expenses: expenses, onRemoveExpense: _removeExpense);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(color: Colors.deepPurple),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.deepPurple),
            onPressed: () {
              _openAddExpense();
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text('Expenses', style: TextStyle(fontSize: 28)),
            const SizedBox(height: 20),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
