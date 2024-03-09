import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';
import 'package:hostels/viewmodels/context_viewmodel_mixin/firebase_auth_viewmodel_mixin.dart';

class LoginWithOtpViewModel extends ContextViewModel
    with FirebaseAuthViewModelMixin {
  //...
  String lcd = "";

  final formKey = GlobalKey<FormState>();

  final phoneNumber = TextEditingController();

  final otp = TextEditingController();

  final pageController = PageController();

  goto(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(seconds: 1),
      curve: Curves.bounceInOut,
    );
  }

  gotoOTPView() {
    goto(1);
  }

  gotoPhoneNumberView() {
    goto(0);
  }

  say(v) {
    final msg = "$v";
    lcd = msg;
    debugPrint(msg);
    notifyListeners();
  }

  getOtp() async {
    return otp.text;
  }

  // login with otp

  Future _loginWithOtp(String phoneNumber) async {
    final auth = FirebaseAuth.instance;
    return  auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        say("1");
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException error) {
        say("2. verification error: \n"
            "phoneNumber: ${error.phoneNumber} \n"
            "message: ${error.message} \n");
        if (error.code == 'invalid-phone-number') {
          say('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        say("3");
        gotoOTPView();

        // Update the UI - wait for the user to enter the SMS code
        otp.addListener(() async {
          //
          String smsCode = await getOtp();

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
        });
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        say("4");
      },
    );
    // await _firedartLogin(email, password);
  }

  Future loginWithOtp(String phoneNumber) {
    return runBusyFuture(_loginWithOtp(phoneNumber));
  }

  Future submit() async {
    lcd = phoneNumber.text;
    if (formKey.currentState!.validate()) {
      final res = await loginWithOtp(phoneNumber.text);
      lcd = res.toString();
      // nav.navigateToStoreView();
    }
  }

  init() async {}
}
