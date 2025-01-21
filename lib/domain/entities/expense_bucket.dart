import 'package:expense_tracker/domain/entities/expense.dart'
    as expense_tracker;
import 'package:expense_tracker/domain/entities/expense.dart';

class ExpenseBucket {
  final expense_tracker.Category category;
  final List<Expense> expenses;

  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
