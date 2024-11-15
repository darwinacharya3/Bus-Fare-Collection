import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String userUid = '';
  String verId = '';
  int? resendTokenId;
  String phoneNumber = '';
  bool phoneAuthCheck = false;
  dynamic credentials;
  Timer? _timer;

  // Method to initiate phone authentication
  Future<void> phoneAuth(String phone) async {
    try {
      credentials = null;
      phoneNumber = phone; // Set the phoneNumber here
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          log('Verification Completed');
          credentials = credential;
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        forceResendingToken: resendTokenId,
        verificationFailed: (FirebaseAuthException e) {
          log('Verification Failed');
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
            Get.snackbar("Error", "The provided phone number is not valid.");
          } else if (e.code == 'BILLING_NOT_ENABLED') {
            debugPrint('Billing is not enabled for this project.');
            Get.snackbar("Error", "Billing is not enabled for this project.");
          } else {
            debugPrint('Verification failed. Error: ${e.message}');
            Get.snackbar("Error", "Verification failed: ${e.message}");
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          log('OTP Code Sent');
          verId = verificationId;
          resendTokenId = resendToken;
          _startResendTimer(); // Starts the resend timer
          Get.snackbar("OTP Sent", "OTP has been sent successfully.");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log('Auto Retrieval Timeout');
          verId = verificationId;
        },
      );
    } catch (e) {
      log("Error occurred during phone authentication: $e");
      Get.snackbar("Error", "Failed to send OTP. Please try again.");
    }
  }

  // Method to start the resend OTP timer
  void _startResendTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 45), () {
      phoneAuth(phoneNumber); // Resends OTP after 45 seconds
    });
  }

  // Method to verify the entered OTP
  Future<bool> verifyOtp(String otpNumber) async {
    log("Verifying OTP...");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: otpNumber,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      log("Logged in successfully");
      return true; // OTP verification succeeded
    } catch (e) {
      log("OTP Verification failed: $e");
      Get.snackbar("Error", "Invalid OTP or verification failed. Please try again.");
      return false; // OTP verification failed
    }
  }

  // Cleanup function to dispose of the timer
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}


// import 'dart:async';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   String userUid = '';
//   var verId = '';
//   int? resendTokenId;
//   String phoneNumber = '';
//   bool phoneAuthCheck = false;
//   dynamic credentials;
//   Timer? _timer;

//   phoneAuth(String phone) async {
//     try {
//       credentials = null;
//       phoneNumber = phone; // Set the phoneNumber here
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phone,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           log('Completed');
//           credentials = credential;
//           await FirebaseAuth.instance.signInWithCredential(credential);
//         },
//         forceResendingToken: resendTokenId,
//         verificationFailed: (FirebaseAuthException e) {
//           log('Failed');
//           if (e.code == 'invalid-phone-number') {
//             debugPrint('The provided phone number is not valid.');
//             Get.snackbar("Error", "The provided phone number is not valid.");
//           } else if (e.code == 'BILLING_NOT_ENABLED') {
//             debugPrint('Billing is not enabled for this project.');
//             Get.snackbar("Error", "Billing is not enabled for this project.");
//           } else {
//             debugPrint('Verification failed. Error: ${e.message}');
//             Get.snackbar("Error", "Verification failed: ${e.message}");
//           }
//         },
//         codeSent: (String verificationId, int? resendToken) async {
//           log('Code sent');
//           verId = verificationId;
//           resendTokenId = resendToken;
//           _startResendTimer();
//           Get.snackbar("OTP Sent", "OTP has been sent successfully.");
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } catch (e) {
//       log("Error occurred: $e");
//       Get.snackbar("Error", "Failed to send OTP. Please try again.");
//     }
//   }

//   _startResendTimer() {
//     _timer?.cancel();
//     _timer = Timer(const Duration(seconds: 45), () {
//       phoneAuth(phoneNumber);
//     });
//   }

//   Future<bool> verifyOtp(String otpNumber) async {
//     log("Verifying OTP...");
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verId,
//       smsCode: otpNumber,
//     );

//     try {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       log("Logged in successfully");
//       return true;
//     } catch (e) {
//       log("OTP Verification failed: $e");
//       Get.snackbar("Error", "Invalid OTP or verification failed. Please try again.");
//       return false;
//     }
//   }
// }
































// import 'dart:async';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   String userUid = '';
//   var verId = '';
//   int? resendTokenId;
//   String phoneNumber = '';
//   bool phoneAuthCheck = false;
//   dynamic credentials;
//   Timer? _timer;

//   phoneAuth(String phone) async {
//     try {
//       credentials = null;
//       phoneNumber = phone; // Set the phoneNumber here
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phone,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           log('Completed');
//           credentials = credential;
//           await FirebaseAuth.instance.signInWithCredential(credential);
//         },
//         forceResendingToken: resendTokenId,
//         verificationFailed: (FirebaseAuthException e) {
//           log('Failed');
//           if (e.code == 'invalid-phone-number') {
//             debugPrint('The provided phone number is not valid.');
//             Get.snackbar("Error", "The provided phone number is not valid.");
//           } else if (e.code == 'BILLING_NOT_ENABLED') {
//             debugPrint('Billing is not enabled for this project.');
//             Get.snackbar("Error", "Billing is not enabled for this project.");
//           } else {
//             debugPrint('Verification failed. Error: ${e.message}');
//             Get.snackbar("Error", "Verification failed: ${e.message}");
//           }
//         },
//         codeSent: (String verificationId, int? resendToken) async {
//           log('Code sent');
//           verId = verificationId;
//           resendTokenId = resendToken;
//           _startResendTimer();
//           Get.snackbar("OTP Sent", "OTP has been sent successfully.");
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } catch (e) {
//       log("Error occurred: $e");
//       Get.snackbar("Error", "Failed to send OTP. Please try again.");
//     }
//   }

//   _startResendTimer() {
//     _timer?.cancel();
//     _timer = Timer(const Duration(seconds: 45), () {
//       phoneAuth(phoneNumber);
//     });
//   }

//   verifyOtp(String otpNumber) async {
//     log("Verifying OTP...");
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verId,
//       smsCode: otpNumber,
//     );

//     try {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       log("Logged in successfully");
//     } catch (e) {
//       log("OTP Verification failed: $e");
//       Get.snackbar("Error", "Invalid OTP or verification failed. Please try again.");
//     }
//   }
// }




























































// import 'dart:async';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   String userUid = '';
//   var verId = '';
//   int? resendTokenId;
//   String phoneNumber = '';
//   bool phoneAuthCheck = false;
//   dynamic credentials;
//   Timer? _timer;

//   phoneAuth(String phone) async {
//     try {
//       credentials = null;
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phone,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           log('Completed');
//           credentials = credential;
//           await FirebaseAuth.instance.signInWithCredential(credential);
//         },
//         forceResendingToken: resendTokenId,
//         verificationFailed: (FirebaseAuthException e) {
//           log('Failed');
//           if (e.code == 'invalid-phone-number') {
//             debugPrint('The provided phone number is not valid.');
//           } else if (e.code == 'BILLING_NOT_ENABLED') {
//             debugPrint('Billing is not enabled for this project.');
//           } else {
//             debugPrint('Verification failed. Error: ${e.message}');
//           }
//         },
//         codeSent: (String verificationId, int? resendToken) async {
//           log('Code sent');
//           verId = verificationId;
//           resendTokenId = resendToken;
//           _startResendTimer();
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } catch (e) {
//       log("Error occurred: $e");
//     }
//   }

//   _startResendTimer() {
//     _timer?.cancel();
//     _timer = Timer(const Duration(seconds: 45), () {
//       phoneAuth(phoneNumber);
//     });
//   }

//   verifyOtp(String otpNumber) async {
//     log("Verifying OTP...");
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verId,
//       smsCode: otpNumber,
//     );

//     try {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       log("Logged in successfully");
//     } catch (e) {
//       log("OTP Verification failed: $e");
//       Get.snackbar("Error", "Invalid OTP or verification failed. Please try again.");
//     }
//   }
// }



































































































// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController{

//   String userUid = '';
//   var verId = '';
//   int? resendTokenId;
//   bool phoneAuthCheck = false;
//   dynamic credentials;


//   phoneAuth(String phone) async {
//     try {
//       credentials = null;
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phone,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           log('Completed');
//           credentials = credential;
//           await FirebaseAuth.instance.signInWithCredential(credential);
//         },
//         forceResendingToken: resendTokenId,
//         verificationFailed: (FirebaseAuthException e) {
//           log('Failed');
//           if (e.code == 'invalid-phone-number') {
//             debugPrint('The provided phone number is not valid.');
//           }
//         },
//         codeSent: (String verificationId, int? resendToken) async {
//           log('Code sent');
//           verId = verificationId;
//           resendTokenId = resendToken;
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } catch (e) {
//       log("Error occured $e");
//     }
//   }

//    verifyOtp(String otpNumber) async {
//     log("Called");
//     PhoneAuthCredential credential =
//         PhoneAuthProvider.credential(verificationId: verId, smsCode: otpNumber);

//     log("LogedIn");

//     await FirebaseAuth.instance.signInWithCredential(credential);
//       }
// }