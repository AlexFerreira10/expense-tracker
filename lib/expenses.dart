import 'package:expense_tracker/data/datasource/list_expense.dart';
import 'package:expense_tracker/domain/entities/expense.dart';
import 'package:expense_tracker/presentation/widgets/chart/chart.dart';
import 'package:expense_tracker/presentation/widgets/expenses_list.dart';
import 'package:expense_tracker/presentation/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _localExpenses = List.from(registeredExpenses);

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // isScrollControlled: true, Allows it to fill the entire screen
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _localExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _localExpenses.indexOf(expense);
    setState(() {
      _localExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _localExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (!_localExpenses.isEmpty) {
      mainContent = Column(
        children: [
          Chart(expenses: _localExpenses),
          Expanded(
            child: Expenseslist(
              expenses: _localExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Expense Tracker',
            style: TextStyle(fontSize: 24),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
