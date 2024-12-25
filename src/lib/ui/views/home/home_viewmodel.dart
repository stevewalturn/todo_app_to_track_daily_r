import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app_to_track_daily_r/app/app.locator.dart';
import 'package:todo_app_to_track_daily_r/app/app.router.dart';
import 'package:todo_app_to_track_daily_r/core/enums/dialog_type.dart';
import 'package:todo_app_to_track_daily_r/core/enums/bottom_sheet_type.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  void navigateToTodoView() {
    _navigationService.navigateToTodoView();
  }

  Future showDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Welcome',
      description: 'Start managing your daily routine with our todo app!',
    );
  }

  Future showBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: 'Features',
      description: 'Create, edit, and track your daily tasks with ease.',
    );
  }
}