import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/text_input/text_input_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TextInput extends StackedView<TextInputViewModel> {
  const TextInput({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String? v)? validator;

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return TextFormField(
      //...

      validator: validator,
      controller: viewModel.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        //...

        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          //...

          borderRadius: BorderRadius.circular(10),

          borderSide: const BorderSide(
            color: ColorResources.dark,
            width: 2,
          ),
        ),

        errorStyle: const TextStyle(
          color: Colors.redAccent,
        ),
      ),
    );
  }

  @override
  TextInputViewModel viewModelBuilder(BuildContext context) {
    return TextInputViewModel(controller: controller);
  }

  @override
  void onViewModelReady(TextInputViewModel viewModel) {}
}
