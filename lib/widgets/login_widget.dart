import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:major_project/controller/auth_controller.dart';
import 'package:major_project/views/otp_verification_screen.dart';
import 'package:major_project/widgets/text_widget.dart';
import 'package:major_project/utils/app_constants.dart';
import 'package:major_project/utils/app_colors.dart';

Widget loginWidget(CountryCode countryCode, Function onCountryChange) {
  final TextEditingController phoneController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        textWidget(
          text: AppConstants.enterMobileNumber,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 40),

        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => onCountryChange(),
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      Expanded(child: countryCode.flagImage()),
                      textWidget(text: countryCode.dialCode),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 55,
                color: Colors.black.withOpacity(0.2),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: AppConstants.enterMobileNumber,
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      // Restrict input to numbers only and limit to 10 digits
                      if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                        // If a non-numeric character is entered, remove it
                        phoneController.text = value.replaceAll(RegExp(r'[^0-9]'), '');
                        phoneController.selection = TextSelection.fromPosition(
                          TextPosition(offset: phoneController.text.length),
                        );
                        ScaffoldMessenger.of(Get.context!).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter numbers only.'),
                          ),
                        );
                      } else if (value.length > 10) {
                        // Limit input length to 10 digits
                        phoneController.text = value.substring(0, 10);
                        phoneController.selection = TextSelection.fromPosition(
                          TextPosition(offset: phoneController.text.length),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        InkWell(
          onTap: () {
            // Check if the phone number has exactly 10 digits before sending OTP and navigating
            if (phoneController.text.length == 10) {
              final String fullPhoneNumber = countryCode.dialCode + phoneController.text;
              authController.phoneAuth(fullPhoneNumber).then((_) {
                // If OTP sent successfully, show success snackbar
                ScaffoldMessenger.of(Get.context!).showSnackBar(
                  const SnackBar(
                    content: Text('OTP sent successfully.'),
                  ),
                );
                Get.to(() => const OtpVerificationScreen()); // Navigate to OTP Verification Screen
              }).catchError((error) {
                // If OTP failed to send, show failure snackbar
                ScaffoldMessenger.of(Get.context!).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to send OTP. Please try again.'),
                  ),
                );
              });
            } else {
              // Show an alert if the phone number is not 10 digits long
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a valid 10-digit mobile number.'),
                ),
              );
            }
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

        const SizedBox(height: 70),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
              children: [
                const TextSpan(
                  text: "${AppConstants.byCreating} ",
                ),
                TextSpan(
                  text: "${AppConstants.termsOfService} ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: "and ",
                ),
                TextSpan(
                  text: "${AppConstants.privacyPolicy} ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

















































































































































































































































  




















































































































































































              

        
