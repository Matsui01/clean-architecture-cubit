import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/router/app_router.dart';
import 'src/config/themes/app_themes.dart';
import 'src/domain/repositories/order_repository.dart';
import 'src/get_it.dart';
import 'src/view/cubits/orders_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrdersCubit(
            getIt<OrderRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Clean Architecture Cubit',
        theme: AppTheme.light,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
