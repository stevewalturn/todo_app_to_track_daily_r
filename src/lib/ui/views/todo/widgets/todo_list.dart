import 'package:flutter/material.dart';
import 'package:todo_app_to_track_daily_r/models/todo.dart';
import 'package:todo_app_to_track_daily_r/ui/views/todo/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onToggle;
  final Function(String) onDelete;
  final Function(Todo) onEdit;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(
        child: Text(
          'No todos yet. Start by adding one!',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onToggle: onToggle,
          onDelete: onDelete,
          onEdit: onEdit,
        );
      },
    );
  }
}
