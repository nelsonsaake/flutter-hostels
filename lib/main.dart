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
      builder: (context, child) {
        return FutureBuilder(
          future: requestPermissions(),
          builder: (context, snapshot) {
            return Container(
              child: child,
            );
          },
        );
      },
      initialRoute: [
        Routes.storeView,
        Routes.playgroundView,
        Routes.roomTypesView,
        Routes.profileView,
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