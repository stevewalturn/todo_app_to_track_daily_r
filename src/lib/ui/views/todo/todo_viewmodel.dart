import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app_to_track_daily_r/app/app.locator.dart';
import 'package:todo_app_to_track_daily_r/models/todo.dart';
import 'package:todo_app_to_track_daily_r/services/todo_service.dart';
import 'package:todo_app_to_track_daily_r/utils/const/const.dart';

class TodoViewModel extends BaseViewModel {
  final _todoService = locator<TodoService>();
  final _dialogService = locator<DialogService>();

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> initialize() async {
    await loadTodos();
  }

  Future<void> loadTodos() async {
    try {
      setBusy(true);
      _todos = await _todoService.getTodos();
      notifyListeners();
    } catch (e) {
      setError(errorLoadingTodos);
    } finally {
      setBusy(false);
    }
  }

  Future<void> addTodo(
      String title, String description, DateTime dueDate) async {
    try {
      setBusy(true);
      await _todoService.addTodo(title, description, dueDate);
      await loadTodos();
    } catch (e) {
      setError(errorSavingTodo);
    } finally {
      setBusy(false);
    }
  }

  Future<void> toggleTodoCompletion(String id) async {
    try {
      setBusy(true);
      await _todoService.toggleTodoCompletion(id);
      await loadTodos();
    } catch (e) {
      setError(errorUpdatingTodo);
    } finally {
      setBusy(false);
    }
  }

  Future<void> deleteTodo(String id) async {
    final response = await _dialogService.showDialog(
      title: deleteTodoTitle,
      description: deleteTodoMessage,
      buttonTitle: confirmButtonText,
      cancelTitle: cancelButtonText,
    );

    if (response?.confirmed ?? false) {
      try {
        setBusy(true);
        await _todoService.deleteTodo(id);
        await loadTodos();
      } catch (e) {
        setError(errorDeletingTodo);
      } finally {
        setBusy(false);
      }
    }
  }
}
