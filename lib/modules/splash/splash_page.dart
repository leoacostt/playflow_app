import 'package:flutter/material.dart';
import 'package:playflow_app/shared/auth/auth_controller.dart';
import 'package:playflow_app/shared/themes/app_colors.dart';
import 'package:playflow_app/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(children: <Widget>[
        Center(child: Image.asset(AppImages.union)),
        Center(child: Image.asset(AppImages.logoFull)),
      ]),
    );
  }
}
