import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:major_project/utils/app_constants.dart';
// import 'package:major_project/utils/app_colors.dart';
import 'package:major_project/widgets/pinput_widget.dart';
import 'package:major_project/widgets/text_widget.dart';

Widget otpVerificationWidget({
  required Function(String otp) onOtpEntered,
  required Function() resendOtp,
}) {
  final RxInt _secondsRemaining = 45.obs;
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining.value = 45; // Reset timer to 45 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining.value > 0) {
        _secondsRemaining.value--;
      } else {
        _timer?.cancel();
        resendOtp(); // Call the resend OTP function when timer reaches 0
      }
    });
  }

  _startTimer();

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
                  text: "${AppConstants.resendCode} in ",
                ),
                TextSpan(
                  text: "${_secondsRemaining.value} seconds",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Trigger the OTP entered function when "Next" is pressed
          },
          child: const Text('Verify OTP'),
        ),
        const SizedBox(height: 30),
      ],
    ),
  ));
}



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';
// import 'package:major_project/utils/app_constants.dart';
// import 'package:major_project/utils/app_colors.dart';
// import 'package:major_project/widgets/pinput_widget.dart';
// import 'package:major_project/widgets/text_widget.dart';

// Widget otpVerificationWidget({
//   required Function() onOtpVerified,
//   required Function() resendOtp,
// }) {
//   final RxInt _secondsRemaining = 45.obs;
//   Timer? _timer;

//   void _startTimer() {
//     _timer?.cancel();
//     _secondsRemaining.value = 45; // Reset timer to 45 seconds
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_secondsRemaining.value > 0) {
//         _secondsRemaining.value--;
//       } else {
//         _timer?.cancel();
//         resendOtp(); // Call the resend OTP function when timer reaches 0
//       }
//     });
//   }

//   _startTimer();

//   return Obx(() => Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       children: [
//         textWidget(
//           text: AppConstants.phoneVerification,
//           fontSize: 12,
//         ),
//         textWidget(
//           text: AppConstants.enterOtp,
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ),
//         const SizedBox(height: 30),
//         const RoundedWithShadow(),
//         const SizedBox(height: 20),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: RichText(
//             textAlign: TextAlign.start,
//             text: TextSpan(
//               style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
//               children: [
//                 const TextSpan(
//                   text: "${AppConstants.resendCode} in ",
//                 ),
//                 TextSpan(
//                   text: "${_secondsRemaining.value} seconds",
//                   style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         InkWell(
//           onTap: () {
//             onOtpVerified();
//           },
//           child: Container(
//             height: 45,
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: AppColors.greenColor,
//             ),
//             child: const Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   'Next',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//       ],
//     ),
//   ));
// }


































































































// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:get/get.dart';
// import 'package:major_project/utils/app_constants.dart';
// import 'package:major_project/utils/app_colors.dart';
// import 'package:major_project/widgets/pinput_widget.dart';
// import 'package:major_project/widgets/text_widget.dart';

// Widget otpVerificationWidget({required Function() onOtpVerified}) {
//   Timer? _timer;
//   int _secondsRemaining = 45;

//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_secondsRemaining > 0) {
//         _secondsRemaining--;
//       } else {
//         _timer?.cancel();
//         // Resend OTP code here
//       }
//     });
//   }

//   _startTimer();

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       children: [
//         textWidget(
//           text: AppConstants.phoneVerification,
//           fontSize: 12,
//         ),
//         textWidget(
//           text: AppConstants.enterOtp,
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ),
//         const SizedBox(height: 30),
//         const RoundedWithShadow(),
//         const SizedBox(height: 20),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: RichText(
//             textAlign: TextAlign.start,
//             text: TextSpan(
//               style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
//               children: [
//                 const TextSpan(
//                   text: "${AppConstants.resendCode} ",
//                 ),
//                 TextSpan(
//                   text: "$_secondsRemaining seconds",
//                   style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         InkWell(
//           onTap: () {
//             onOtpVerified();
//           },
//           child: Container(
//             height: 45,
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: AppColors.greenColor,
//             ),
//             child: const Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   'Next',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//       ],
//     ),
//   );
// }



































































































// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';
// import 'package:major_project/views/otp_verification_screen.dart';
// import 'package:major_project/widgets/pinput_widget.dart';
// import 'package:major_project/widgets/text_widget.dart';
// import 'package:major_project/utils/app_constants.dart';
// import 'package:major_project/utils/app_colors.dart';

// Widget otpVerificationWidget(){

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
        
//         children: [
//           textWidget(text:AppConstants.phoneVerification,fontSize: 12,),
//           textWidget(text:AppConstants.enterOtp,fontSize: 22, fontWeight: FontWeight.bold),
//            const SizedBox(height: 30,),

//            const RoundedWithShadow(),

//            const SizedBox(height: 20,),

//             Padding(
//              padding: const EdgeInsets.symmetric(horizontal:20),
//              child: RichText(
//               textAlign: TextAlign.start,
//               text: TextSpan(
//                 style: GoogleFonts.poppins(color: Colors.black,fontSize: 12),
                
//               children: [
//                 const TextSpan(
//                   text: "${AppConstants.resendCode} " ,
//                  ),
//                  TextSpan(
//                   text: "10 seconds",
//                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)
//                  ),
//                 ],
//              ),),
//            ),

//             const SizedBox(height: 20,),

//            InkWell(
//               onTap: (){
//                 Get.to(()=> const OtpVerificationScreen());
//               },
//                child: Container(
//                   height: 45,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: AppColors.greenColor,
//                           ),
//                   child: const Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Icon(
//                           Icons.arrow_forward,
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                           ),
//              ),
           
           
    
//            const SizedBox(height: 30,),
    
          
      
//       ],
//       ),
//   );
    
  
// }
