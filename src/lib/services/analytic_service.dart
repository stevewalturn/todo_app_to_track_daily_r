import 'package:stacked/stacked_annotations.dart';

class AnalyticService implements InitializableDependency {
  @override
  Future<void> init() async {
    // Initialize analytics service
    await Future.delayed(const Duration(seconds: 1));
  }

  void logTodoCreated() {
    // Log todo creation event
  }

  void logTodoCompleted() {
    // Log todo completion event
  }

  void logTodoDeleted() {
    // Log todo deletion event
  }

  void logTodoUpdated() {
    // Log todo update event
  }

  void logError(String errorMessage) {
    // Log error event
  }
}
