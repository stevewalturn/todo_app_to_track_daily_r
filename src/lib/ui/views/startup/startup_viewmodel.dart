import 'package:stacked/stacked.dart';
import 'package:todo_app_to_track_daily_r/app/app.locator.dart';
import 'package:todo_app_to_track_daily_r/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await _navigationService.replaceWithTodoView();
    } catch (e) {
      setError('Failed to initialize the application. Please restart the app.');
    }
  }
}
