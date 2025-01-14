import 'package:expense_tracker/domain/entities/expense.dart';
import 'package:expense_tracker/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenerateUuidExpenseUseCase {
  final ExpenseRepository _repository;

  GenerateUuidExpenseUseCase(this._repository);

  Future<String> call({required Expense expense}) async =>
      await _repository.generateUuidExpense(expense: expense);
}
