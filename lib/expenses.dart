import 'package:expense_tracker/data/datasource/list_expense.dart';
import 'package:expense_tracker/domain/entities/expense.dart';
import 'package:expense_tracker/presentation/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> localExpenses = List.from(registeredExpenses);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Text("grafics"),
            Expanded(child: Expenseslist(expenses: localExpenses)),
          ],
        ),
      );
}
