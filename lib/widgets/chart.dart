import 'package:expense_manager/enums/category_enums.dart';
import 'package:expense_manager/widgets/chart_Bar.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;

  const Chart({super.key, required this.expenses});

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, ExpenseCategory.food),
      ExpenseBucket.forCategory(expenses, ExpenseCategory.leisure),
      ExpenseBucket.forCategory(expenses, ExpenseCategory.travel),
      ExpenseBucket.forCategory(expenses, ExpenseCategory.work),
    ];
  }

  double get maxTotalExpenses {
    double maxTotalExpenses = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpenses) {
        maxTotalExpenses = bucket.totalExpenses;
      }
    }
    return maxTotalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpenses,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
              children: buckets
                  .map(
                    (bucket) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          categoryIcons[bucket.category],
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.9),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
