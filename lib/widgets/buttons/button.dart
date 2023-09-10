import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';

class Button extends StatelessWidget {
  const Button(
    this.label, {
    this.onTap,
    this.isBusy = true,
    this.fillWidth = false,
    super.key,
  });

  final String label;
  final bool isBusy;
  final bool fillWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      //...

      style: TextButton.styleFrom(
        //...

        backgroundColor: ColorResources.dark,

        minimumSize: Size(fillWidth ? double.maxFinite : 300, 50),
        maximumSize: Size(fillWidth ? double.maxFinite : 300, 50),

        elevation: 2,
      ),

      onPressed: isBusy ? null : onTap,

      child: Center(
        child: isBusy
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
