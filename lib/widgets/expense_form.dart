import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});
  @override
  State<ExpenseForm> createState() {
    return _ExpenseFormState();
  }
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _category = Category.other;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      if (pickedDate != null) {
        _selectedDate = pickedDate;
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      prefixText: '\$ ',
                      labelText: 'Amount',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {
                          _datePicker();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: DropdownButton(
                    value: _category,
                    items:
                        Category.values
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item.name.toString().toUpperCase()),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _category = value;
                        });
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
