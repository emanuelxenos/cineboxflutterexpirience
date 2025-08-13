import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderAndMessage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoader();
          await Future.delayed(Duration(seconds: 3));
          hideLoader();
          showErrorSnackBar('Error Raniere');
        },
      ),
      body: Image.asset(R.ASSETS_IMAGES_BG_LOGIN_PNG),
    );
  }
}
