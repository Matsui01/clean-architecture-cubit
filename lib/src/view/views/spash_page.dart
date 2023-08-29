import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_cubit/src/config/router/app_router.dart';
import 'package:clean_architecture_cubit/src/view/cubits/splash/spash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Duration _duration = const Duration(milliseconds: 650);
  final Duration _durationLogoAnimation = const Duration(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        context.read<SpashCubit>().login(),
        Future.delayed(_duration),
      ]).then((List values) {
        if (values.first == null) {
          context.pushRoute(const AuthRoute());
        } else {
          context.pushRoute(const HomeRoute());
        }
      });
      context.read<SpashCubit>().setDistance(MediaQuery.of(context).size.width);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpashCubit, double>(
      builder: (context, state) {
        return Center(
          child: AnimatedContainer(
            duration: _durationLogoAnimation,
            curve: Curves.easeInQuint,
            width: state,
            child: Hero(
              tag: "logo",
              child: Image.asset("assets/images/logo.jpg"),
            ),
          ),
        );
      },
    );
  }
}
