
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/utils/app_colors.dart';
import 'package:major_project/views/login_screen.dart';
import 'package:major_project/widgets/green_intro_widget.dart';
import 'package:major_project/widgets/welcome_widget.dart';
// import 'package:major_project/widgets/login_widget.dart';
// import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  // final countryPicker = const  FlCountryCodePicker();


  // CountryCode countryCode = const CountryCode(name: "Nepal", code: "NP", dialCode: "+977");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              greenIntroWidget(),
          
              const SizedBox(height: 30,),

              Stack(
                children:[
                  welcomeWidget(),

                  Positioned(
                    top: 100,
                    left: 120,
                    child: InkWell(
                      onTap:(){
                        Get.to(()=> const LoginScreen());
                        
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenColor,
                      
                        ),
                        child: const Icon(Icons.arrow_forward,color: Colors.white,),
                      ),
                    ),
                  )
                
                ]
                 )
          
          
            ],
          ),
        ),
      ),
    );
  }
}