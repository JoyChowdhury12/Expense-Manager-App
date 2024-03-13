import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expense_list_item.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseListItem(
        expense: expenses[index],
      ),
    );
  }
}
