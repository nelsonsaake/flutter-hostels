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
        Routes.roomsView,
        Routes.registerView,
        Routes.playgroundView,
        Routes.loginView,
        Routes.verifyEmailView,
      ].first,
    );
  }
}


// 9kJ1xxnYPJW1uDIwjCrN

// user photo management 
// verify payment, long polling style
// use the payment records to determine which room is available
// room current book capacity 
// total capacity 
// available capacity
// edit profile
// splash screen