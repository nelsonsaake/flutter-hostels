import 'dart:convert';

import 'package:hostels/firestore/firestore_config.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/admins_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firestorage_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firestore_actions_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_users_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/photo_viewmodel_mixin.dart';

class PlaygroundViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        FirestoreActionsViewModelMixin,
        AdminsViewModelMixin,
        GetRoomsViewModelMixin,
        GetUsersViewModelMixin,
        FirestrogeViewModelMixin,
        PhotoViewModelMixin {
  //...

  dynamic _data;

  data() {
    //...

    dynamic data = _data ?? uploadPercentage;

    try {
      if (data == null) return "";

      dynamic map;
      if (data is List<String>) {
        map = data;
      } else if (data is List) {
        map = data.map((v) => v.toMap()).toList();
      } else {
        map = data?.toMap();
      }

      String prettyJson = const JsonEncoder.withIndent('  ').convert(map);
      return prettyJson;
    } catch (e) {
      //...
      return "$data";
    }
  }

  final _email = FirestoreConfig.email;
  final _password = FirestoreConfig.password;

  do0() async {
    await register(_email, _password);
    if (!isEmailVerified) {
      await sendEmailVerification();
    }
  }

  Future runSeeder() async {
    await firestoreinit();
    await fresh();
    await seed();
    await getUsers();
  }

  onPressed() async {
    // login
    login("nelsonsaakekofi@gmail.com", "password");

    //...
    _data = null;

    // seed
    // await runSeeder();
  }

  init() async {
    _data = [
      "playground initialized",
      DateTime.now(),
    ].join('\n');
  }
}
