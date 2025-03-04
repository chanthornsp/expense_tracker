import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  categoryIcons[expense.category],
                  size: 24,
                  color: const Color.fromARGB(255, 92, 4, 110),
                ),
                const SizedBox(width: 10),
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),

            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.calendar_month, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(
                  expense.formattedDate,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
