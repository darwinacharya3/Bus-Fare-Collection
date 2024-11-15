import 'package:flutter/material.dart';
import 'package:major_project/widgets/green_intro_widget.dart';

class SetupProfileScreen extends StatelessWidget {
  const SetupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          greenIntroWidget(),
          const Expanded(
            child: Center(
              child: Text(
                'SETUP PROFILE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
