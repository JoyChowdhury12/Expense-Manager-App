import 'package:expense_manager/enums/category_enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:expense_manager/enums/category_enums.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();
const categoryIcons = {
  ExpenseCategory.food: Icons.dining,
  ExpenseCategory.travel: Icons.airport_shuttle,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  String get FormattedDate {
    return formatter.format(date);
  }
}
