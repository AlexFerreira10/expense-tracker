import 'package:expense_tracker/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchFormattedDateUseCase {
  final ExpenseRepository _repository;

  FetchFormattedDateUseCase(this._repository);

  Future<String> call({required DateTime date}) async =>
      await _repository.fetchformattedDate(date: date);
}
