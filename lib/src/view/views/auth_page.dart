import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/constants/app_sizes.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: "logo",
              child: Image.asset("assets/images/logo.jpg"),
            ),
          ),
          const SizedBox(height: AppSizes.defaultSize),
          _ExternalLoginWidget(
            text: "Google",
            path: "assets/icons/google.png",
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(height: AppSizes.childSpacing),
          _ExternalLoginWidget(
            text: "Facebook",
            path: "assets/icons/facebook.svg",
            color: AppColor.facebook,
            onPressed: () {},
          ),
          const SizedBox(height: AppSizes.childSpacing),
          SignInWithAppleButton(
            onPressed: () {},
            height: AppSizes.heightSize,
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
        ],
      ),
    );
  }
}

class _ExternalLoginWidget extends StatelessWidget {
  final String text;
  final String path;
  final Color color;
  final void Function() onPressed;

  const _ExternalLoginWidget({
    Key? key,
    required this.text,
    required this.path,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        elevation: AppSizes.elevation,
        maximumSize: const Size(1000, 34),
        minimumSize: const Size(0, 34),
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSize),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          path.contains(".svg")
              ? SvgPicture.asset(
                  path,
                  width: 15,
                  height: 15,
                )
              : Image.asset(
                  path,
                  height: 15,
                  width: 15,
                ),
          const SizedBox(width: 5.9),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
