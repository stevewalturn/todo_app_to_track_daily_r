import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_to_track_daily_r/app/app.bottomsheets.dart';
import 'package:todo_app_to_track_daily_r/app/app.dialogs.dart';
import 'package:todo_app_to_track_daily_r/app/app.locator.dart';

import 'features/app/app_view.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();

    runApp(const AppView());
  }, (exception, stackTrace) async {
    // Handle exceptions here
    print('Caught error: $exception');
    print('Stack trace: $stackTrace');
    // You might want to log this to a service or show a user-friendly error message
  });
}
