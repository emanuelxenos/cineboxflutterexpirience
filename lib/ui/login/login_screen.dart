import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/login/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(top: 108),
            child: Column(
              spacing: 48,
              children: [
                Image.asset(
                  R.ASSETS_IMAGES_LOGO_PNG,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SignInGoogleButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
