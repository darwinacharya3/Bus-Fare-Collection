import 'package:flutter/material.dart';
import 'package:major_project/utils/app_constants.dart';
import 'package:major_project/widgets/text_widget.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';

Widget welcomeWidget(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    
      child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text:AppConstants.welcometoourapp,fontSize: 25),
        textWidget(text:AppConstants.letsgetstarted,fontSize: 30,fontWeight: FontWeight.bold),

         const SizedBox(height: 100,),

        
         
    
    ],
    ),
    
  );
  
}