import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playflow_app/modules/login/login_controller.dart';
import 'package:playflow_app/shared/themes/app_colors.dart';
import 'package:playflow_app/shared/themes/app_images.dart';
import 'package:playflow_app/shared/themes/app_text_styles.dart';
import 'package:playflow_app/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.36,
            color: AppColors.primary,
          ),
          Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 323,
              )),
          Positioned(
            bottom: size.height * 0.10,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.logomini),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: Text(
                    'Organize seus boletos em um só lugar',
                    style: TextStyles.titleHome,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: SocialLoginButton(onTap: (() {
                    controller.googleSignIn(context);
                  })),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
