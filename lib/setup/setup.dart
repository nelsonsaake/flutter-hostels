import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "semper-elections",
    options: FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
    ),
  );
}
