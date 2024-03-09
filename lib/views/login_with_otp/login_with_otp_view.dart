import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/input_label/input_label.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/text_input/text_input.dart';
import 'package:hostels/widgets/view_title/view_title.dart';
import 'package:stacked/stacked.dart';

import 'login_with_otp_viewmodel.dart';

class LoginWithOtpView extends StackedView<LoginWithOtpViewModel> {
  const LoginWithOtpView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginWithOtpViewModel viewModel,
    child,
  ) {
    //...

    return ViewLayout(
      //...

      applyPadding: true,

      // noScroll: true,

      child: Builder(
        builder: (context) {
          //...

          return Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //...

                const Space.vertical(50),

                // title

                const Center(
                  child: ViewTitle("Login"),
                ),

                const Space.vertical(50),

                Container(
                  color: Colors.white,
                  height: 150,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(viewModel.lcd),
                ),

                const Space.vertical(50),

                // email

                Container(
                  height: 100,
                  child: PageView(
                    controller: viewModel.pageController,
                    children: [
                      //...

                      Column(
                        children: [
                          const InputLabel("Phone Number:"),
                          TextInput(
                            controller: viewModel.phoneNumber,
                            validator: ValidationBuilder().phone().build(),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          const InputLabel("OTP:"),
                          TextInput(
                            controller: viewModel.otp,
                            validator: ValidationBuilder()
                                .required("Please enter OTP to continue.")
                                .build(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const Space.vertical(50),

                // submit

                Center(
                  child: Button(
                    "Submit",
                    isBusy: viewModel.isBusy,
                    onTap: viewModel.submit,
                  ),
                ),

                // ...

                const Space.vertical(120),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  LoginWithOtpViewModel viewModelBuilder(BuildContext context) {
    return LoginWithOtpViewModel();
  }

  @override
  void onViewModelReady(LoginWithOtpViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
