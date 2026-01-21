import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInputWidget extends StatelessWidget {
  const PinInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the default style for the boxes
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 65,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Color(0xFF333333),
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F6FA), // Background color
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Center(
      child: Pinput(
        length: 6,
        defaultPinTheme: defaultPinTheme,
        // You can customize the focused state to have a border if you like
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Colors.blueAccent),
          ),
        ),
        onCompleted: (pin) => print(pin),
      ),
    );
  }
}
