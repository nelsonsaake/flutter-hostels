import 'package:flutter/material.dart';

class BusyIndicator extends StatelessWidget {
  const BusyIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: 25,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      ),
    );
  }
}
