import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app_to_track_daily_r/ui/common/app_colors.dart';
import 'package:todo_app_to_track_daily_r/ui/common/ui_helpers.dart';
import 'package:todo_app_to_track_daily_r/ui/views/home/home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Daily Routine Manager',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpaceMedium,
                MaterialButton(
                  color: kcPrimaryColor,
                  onPressed: viewModel.navigateToTodoView,
                  child: const Text(
                    'View My Tasks',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                verticalSpaceSmall,
                MaterialButton(
                  color: kcPrimaryColor,
                  onPressed: viewModel.showDialog,
                  child: const Text(
                    'Show Info',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                verticalSpaceSmall,
                MaterialButton(
                  color: kcPrimaryColor,
                  onPressed: viewModel.showBottomSheet,
                  child: const Text(
                    'Show Features',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
