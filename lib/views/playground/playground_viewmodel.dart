import 'dart:convert';

import 'package:hostels/firestore/firestore_config.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/admins_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firestore_actions_viewmodel_mixin.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/get_rooms_viewmodel_mixin.dart';

class PlaygroundViewModel extends ContextViewModel
    with
        FirebaseAuthViewModelMixin,
        FirestoreActionsViewModelMixin,
        AdminsViewModelMixin,
        GetRoomsViewModelMixin {
  //...

  data() {
    //...

    dynamic data = isAdmin("nelsonsaakekofi@gmail.com");

    try {
      if (data == null) return "";

      dynamic map;
      if (data is List) {
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

  Future do1() async {
    await login(_email, _password);
  }

  onPressed() async {
    //...
    await do1();
    await toggleAdminAccess(_email);
    // await fresh();
    // await seed();
    // await getRooms();
  }
}
