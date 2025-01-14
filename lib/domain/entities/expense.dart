import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'expense.freezed.dart';

enum Category { food, travel, leisure, work }

const uuid = Uuid();

@Freezed()
class Expense with _$Expense {
  const factory Expense({
    @Default(Uuid()) final Uuid id,
    required final String title,
    required final double amount,
    required final DateTime date,
    required final Category category,
  }) = _Expense;
}
