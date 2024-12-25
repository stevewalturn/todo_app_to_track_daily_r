import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app_to_track_daily_r/ui/common/app_colors.dart';
import 'package:todo_app_to_track_daily_r/ui/common/ui_helpers.dart';
import 'package:todo_app_to_track_daily_r/utils/const/const.dart';
import 'package:todo_app_to_track_daily_r/ui/dialogs/todo_form/todo_form_dialog_model.dart';

class TodoFormDialog extends StackedView<TodoFormDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const TodoFormDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TodoFormDialogModel viewModel,
    Widget? child,
  ) {
    final titleController = TextEditingController(
      text: viewModel.todo?.title ?? '',
    );
    final descriptionController = TextEditingController(
      text: viewModel.todo?.description ?? '',
    );
    DateTime? selectedDate = viewModel.todo?.dueDate;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewModel.isEditing ? editTodoTitle : addTodoTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpaceMedium,
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: titleHint,
                errorText: viewModel.titleError,
              ),
            ),
            verticalSpaceSmall,
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: descriptionHint,
                errorText: viewModel.descriptionError,
              ),
            ),
            verticalSpaceSmall,
            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  selectedDate = date;
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate != null
                          ? selectedDate!.toString().split(' ')[0]
                          : dueDateHint,
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            if (viewModel.dueDateError != null)
              Text(
                viewModel.dueDateError!,
                style: const TextStyle(color: kcErrorRed, fontSize: 12),
              ),
            verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                  child: const Text(cancelButtonText),
                ),
                horizontalSpaceSmall,
                ElevatedButton(
                  onPressed: () {
                    if (viewModel.validateInputs(
                      titleController.text,
                      descriptionController.text,
                      selectedDate,
                    )) {
                      completer(
                        DialogResponse(
                          confirmed: true,
                          data: {
                            'title': titleController.text,
                            'description': descriptionController.text,
                            'dueDate': selectedDate,
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                      viewModel.isEditing ? saveButtonText : addButtonText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  TodoFormDialogModel viewModelBuilder(BuildContext context) =>
      TodoFormDialogModel();
}
