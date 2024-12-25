import 'package:todo_app_to_track_daily_r/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo_app_to_track_daily_r/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_app_to_track_daily_r/ui/dialogs/todo_form/todo_form_dialog.dart';
import 'package:todo_app_to_track_daily_r/ui/views/home/home_view.dart';
import 'package:todo_app_to_track_daily_r/ui/views/startup/startup_view.dart';
import 'package:todo_app_to_track_daily_r/ui/views/todo/todo_view.dart';
import 'package:todo_app_to_track_daily_r/services/todo_service.dart';
import 'package:todo_app_to_track_daily_r/services/analytic_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TodoView),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TodoService),
    InitializableSingleton(classType: AnalyticService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: TodoFormDialog),
  ],
)
class App {}
