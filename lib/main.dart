import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/setup/setup.dart';
import 'package:hostels/theme/theme.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setup().then((_) {
    return runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: StringResources.appName,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: [
        Routes.roomTypesView,
        Routes.profileView,
        Routes.playgroundView,
        Routes.storeView,
        Routes.paymentsView,
        Routes.loginView,
        Routes.myRoomView,
        Routes.roomTypesView,
        Routes.createRoomTypeView,
        Routes.floorsView,
        Routes.createRoomView,
        Routes.roomsView,
        Routes.registerView,
        Routes.verifyEmailView,
      ].first,
    );
  }
}

// add photos to roomTypesView
// add room photo to my room view
// edit room type > reload the page when photo is editted
// add a photo picker to create room view
// splash screen and logo