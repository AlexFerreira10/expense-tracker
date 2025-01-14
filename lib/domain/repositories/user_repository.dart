import 'package:expense_tracker/domain/entities/expense.dart';

abstract interface class ExpenseRepository {
  Future<String> generateUuidExpense({required Expense expense});
}
