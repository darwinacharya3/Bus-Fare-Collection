import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controller/auth_controller.dart';
import 'package:major_project/utils/app_colors.dart';
import 'package:major_project/views/setup_profile_screen.dart.dart';
import 'package:major_project/widgets/green_intro_widget.dart';
import 'package:major_project/widgets/otp_verification_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  greenIntroWidget(),
                  Positioned(
                    top: 60,
                    left: 30,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.greenColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              otpVerificationWidget(
                onOtpEntered: (enteredOtp) async {
                  bool success = await authController.verifyOtp(enteredOtp);
                  if (success) {
                    Get.to(() => const SetupProfileScreen());
                  } else {
                    Get.snackbar("Error", "Invalid OTP. Please try again.");
                  }
                },
                resendOtp: () {
                  authController.phoneAuth(authController.phoneNumber);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:major_project/controller/auth_controller.dart';
// import 'package:major_project/utils/app_colors.dart';
// import 'package:major_project/views/setup_profile_screen.dart.dart';
// import 'package:major_project/widgets/green_intro_widget.dart';
// import 'package:major_project/widgets/otp_verification_widget.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key});

//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final AuthController authController = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: Get.width,
//           height: Get.height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   greenIntroWidget(),
//                   Positioned(
//                     top: 60,
//                     left: 30,
//                     child: InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Container(
//                         width: 45,
//                         height: 45,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           Icons.arrow_back,
//                           color: AppColors.greenColor,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               otpVerificationWidget(
//                 onOtpVerified: () {
//                   // Navigate to SetupProfileScreen after successful OTP verification
//                   Get.to(() => const SetupProfileScreen());
//                 },
//                 resendOtp: () {
//                   // Resend the OTP using phoneAuth method and show feedback
//                   authController.phoneAuth(authController.phoneNumber);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




































































































// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:major_project/controller/auth_controller.dart';
// import 'package:major_project/widgets/green_intro_widget.dart';
// import 'package:major_project/utils/app_colors.dart';
// import 'package:major_project/widgets/otp_verification_widget.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key});

//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final AuthController authController = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: Get.width,
//           height: Get.height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   greenIntroWidget(),
//                   Positioned(
//                     top: 60,
//                     left: 30,
//                     child: InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Container(
//                         width: 45,
//                         height: 45,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           Icons.arrow_back,
//                           color: AppColors.greenColor,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               otpVerificationWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



































































































// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:major_project/controller/auth_controller.dart';
// import 'package:major_project/widgets/green_intro_widget.dart';
// import 'package:major_project/utils/app_colors.dart';
// import 'package:major_project/widgets/otp_verification_widget.dart';


// class OtpVerificationScreen extends StatefulWidget{
  
//   const OtpVerificationScreen({super.key});
  

//   @override
//   State<OtpVerificationScreen> createState() {
//     return _OtpVerificationScreenState();
//   }
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen>{

//   AuthController authController = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: Get.width,
//           height: Get.height,
        
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(children:[
//                 greenIntroWidget(),
//                  Positioned(
//                 top: 60,
//                 left: 30,
//                 child: InkWell(
//                   onTap: (){
//                     Get.back();
//                   },
//                   child: Container(
//                             width: 45,
//                             height: 45,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             child: const Icon(
//                               Icons.arrow_back,
//                               color: AppColors.greenColor,
//                               size: 20,
//                             ),
//                           ),
//                 ),
//               ),
        
//               ] ),
             
//             // const SizedBox(height: 30,),
//             // const Text("OTP VERIFICATION SCREEN",),
        
//             const SizedBox(height: 20,),
        
//             otpVerificationWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
    
//   }
// }