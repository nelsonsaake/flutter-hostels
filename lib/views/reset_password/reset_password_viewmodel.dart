import 'package:flutter/material.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';

class ResetPasswordViewModel extends ContextViewModel
    with FirebaseAuthViewModelMixin {
  //...

  final formKey = GlobalKey<FormState>();

  init() async {}
}
