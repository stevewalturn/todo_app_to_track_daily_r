import 'package:todo_app_to_track_daily_r/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo_app_to_track_daily_r/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_app_to_track_daily_r/features/home/home_view.dart';
import 'package:todo_app_to_track_daily_r/features/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
