import 'package:auto_route/auto_route.dart';

import '../../view/views/auth_page.dart';
import '../../view/views/home_page.dart';
import '../../view/views/spash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: SplashRoute.page, initial: true),
      ];
}
