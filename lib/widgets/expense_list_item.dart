import 'package:expense_manager/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;
  const ExpenseListItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text("\$${expense.amount.toStringAsFixed(2)}"),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(expense.FormattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
