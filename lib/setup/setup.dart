import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:hostels/app/app.locator.dart';
import 'package:hostels/caches/cache_firestore_credentails.dart';
import 'package:hostels/caches/cache_using_shared_preferences.dart';
import 'package:hostels/firebase_options.dart';
import 'package:hostels/firestore/firestore_config.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  await CacheUsingSharedPrederences.initSharedPreferences();

  // use this to manage users
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // use this to manage the firestore records
  FirebaseAuth.initialize(FirestoreConfig.apiKey, CachedTokenStore());

  // connect firestore to a project
  Firestore.initialize(FirestoreConfig.projectId);
}
