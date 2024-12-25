import 'package:stacked/stacked.dart';
import 'package:todo_app_to_track_daily_r/models/todo.dart';
import 'package:todo_app_to_track_daily_r/utils/const/const.dart';

class TodoFormDialogModel extends BaseViewModel {
  Todo? _todo;
  Todo? get todo => _todo;

  bool get isEditing => _todo != null;

  String? _titleError;
  String? get titleError => _titleError;

  String? _descriptionError;
  String? get descriptionError => _descriptionError;

  String? _dueDateError;
  String? get dueDateError => _dueDateError;

  void setTodo(Todo? todo) {
    _todo = todo;
    notifyListeners();
  }

  bool validateInputs(String title, String description, DateTime? dueDate) {
    bool isValid = true;
    _titleError = null;
    _descriptionError = null;
    _dueDateError = null;

    if (title.isEmpty) {
      _titleError = titleRequiredMessage;
      isValid = false;
    }

    if (description.isEmpty) {
      _descriptionError = descriptionRequiredMessage;
      isValid = false;
    }

    if (dueDate == null) {
      _dueDateError = dueDateRequiredMessage;
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }
}
