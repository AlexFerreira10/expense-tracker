import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'expense.freezed.dart';

final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

// Constante de Mapeamento
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

const uuid = Uuid();

@Freezed()
class Expense with _$Expense {
  const Expense._(); // Construtor privado necessário para getters personalizados

  const factory Expense({
    @Default(Uuid()) final Uuid id,
    required final String title,
    required final double amount,
    required final DateTime date,
    required final Category category,
  }) = _Expense;

  String get formattedDate {
    return formatter.format(date);
  }
}
