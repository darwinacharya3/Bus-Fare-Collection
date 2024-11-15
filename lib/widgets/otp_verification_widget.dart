import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:major_project/utils/app_constants.dart';
import 'package:major_project/utils/app_colors.dart';
import 'package:major_project/widgets/pinput_widget.dart';
import 'package:major_project/widgets/text_widget.dart';

Widget otpVerificationWidget({
  required Function() onOtpVerified,
  required Function() resendOtp,
}) {
  final RxInt _secondsRemaining = 90.obs; // Updated to 90 seconds
  Timer? _timer;

  // Function to start or restart the timer
  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining.value = 90; // Reset timer to 90 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining.value > 0) {
        _secondsRemaining.value--;
      } else {
        // Resend OTP automatically when timer reaches zero
        _timer?.cancel();
        resendOtp();
        _startTimer(); // Restart the timer
      }
    });
  }

  _startTimer(); // Initialize the timer on widget creation

  return Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            textWidget(
              text: AppConstants.phoneVerification,
              fontSize: 12,
            ),
            textWidget(
              text: AppConstants.enterOtp,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            const RoundedWithShadow(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                  children: [
                    const TextSpan(
                      text: "Didn't receive the code? ",
                    ),
                    TextSpan(
                      text: AppConstants.resendCode,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: AppColors.greenColor,
                        decoration: TextDecoration.underline,
                      ),
                      // Clickable "Resend Code" text
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _timer?.cancel(); // Cancel current timer
                          resendOtp(); // Resend the OTP manually
                          _startTimer(); // Restart the timer
                        },
                    ),
                    TextSpan(
                      text: " in ${_secondsRemaining.value} seconds",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                onOtpVerified();
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.greenColor,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ));
}

