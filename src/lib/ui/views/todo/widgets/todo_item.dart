import 'package:flutter/material.dart';
import 'package:todo_app_to_track_daily_r/models/todo.dart';
import 'package:todo_app_to_track_daily_r/ui/common/app_colors.dart';
import 'package:todo_app_to_track_daily_r/ui/common/ui_helpers.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(String) onToggle;
  final Function(String) onDelete;
  final Function(Todo) onEdit;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kcTodoCardBackground,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (_) => onToggle(todo.id),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            Text(todo.description),
            verticalSpaceTiny,
            Text(
              'Due: ${todo.dueDate.toString().split(' ')[0]}',
              style: const TextStyle(
                fontSize: 12,
                color: kcMediumGrey,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => onEdit(todo),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete(todo.id),
            ),
          ],
        ),
      ),
    );
  }
}
