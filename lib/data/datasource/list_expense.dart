import 'package:expense_tracker/domain/entities/expense.dart';

final List<Expense> registeredExpenses = [
  Expense(
      title: 'Flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work),
  Expense(
      title: 'Monthly purchase',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.food),
  Expense(
      title: 'Boat trip',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.travel),
];
