import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app_to_track_daily_r/ui/common/app_colors.dart';
import 'package:todo_app_to_track_daily_r/ui/common/ui_helpers.dart';
import 'package:todo_app_to_track_daily_r/ui/views/todo/todo_viewmodel.dart';
import 'package:todo_app_to_track_daily_r/ui/views/todo/widgets/todo_list.dart';
import 'package:todo_app_to_track_daily_r/utils/const/const.dart';

class TodoView extends StackedView<TodoViewModel> {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TodoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Routine'),
        centerTitle: true,
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                TodoList(
                  todos: viewModel.todos,
                  onToggle: viewModel.toggleTodoCompletion,
                  onDelete: viewModel.deleteTodo,
                  onEdit: (todo) async {
                    // Handle edit
                    final result = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(editTodoTitle),
                        // Add edit form here
                      ),
                    );
                    if (result != null) {
                      // Handle result
                    }
                  },
                ),
                if (viewModel.modelError != null)
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: kcErrorRed.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        viewModel.modelError.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Handle add new todo
          final result = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(addTodoTitle),
              // Add new todo form here
            ),
          );
          if (result != null) {
            // Handle result
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  TodoViewModel viewModelBuilder(BuildContext context) => TodoViewModel();

  @override
  void onViewModelReady(TodoViewModel viewModel) => viewModel.initialize();
}
