import 'package:expense_manager/screens/expense_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var kColourScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

var kDarkColourScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      cardTheme: CardTheme().copyWith(
          color: kDarkColourScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColourScheme.primaryContainer,
            foregroundColor: kDarkColourScheme.onPrimaryContainer),
      ),
    ),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColourScheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColourScheme.onPrimaryContainer,
            foregroundColor: kColourScheme.onPrimary),
        cardTheme: CardTheme().copyWith(
            color: kColourScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColourScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColourScheme.onSecondaryContainer,
                fontSize: 16))),
    home: ExpenseScreen(),
  ));
}
