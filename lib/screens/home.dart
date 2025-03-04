import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/widgets/expense_form.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  void _openAddExpense(){
    showModalBottomSheet(context: context, builder: (context)=>ExpenseForm());
  }
  @override
  Widget build(BuildContext context) {
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
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text('Expenses',style: TextStyle(fontSize: 28),),
          const SizedBox(height: 20),
          Expanded(child: ExpensesList(expenses: expenses)),
        ],
      ),
    ),
    );
  }
}
