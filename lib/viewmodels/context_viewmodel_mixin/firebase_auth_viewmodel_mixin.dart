import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin FirebaseLoginViewModelMixin on ContextViewModel {
  //...

  static UserCredential? _userCredential;

  static User? _user;

  static User? get user => _user;

  // is email verified

  bool get isEmailVerified => user?.emailVerified == true;

  // register

  Future _register(String email, String password) async {
    _userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    _user = _userCredential?.user;
  }

  Future register(String email, String password) {
    return runBusyFuture(_register(email, password));
  }

  // send email verification

  Future _sendEmailVerification() async {
    await user?.sendEmailVerification();
  }

  Future sendEmailVerification() async {
    return runBusyFuture(_sendEmailVerification());
  }

  // login

  Future _login(String email, String password) async {
    _userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    _user = _userCredential?.user;
  }

  Future login(String email, String password) {
    return runBusyFuture(_login(email, password));
  }

  // logout

  Future _logout() async {
    _user = null;
    await FirebaseAuth.instance.signOut();
  }

  Future logout() async {
    return runBusyFuture(_logout());
  }
}
