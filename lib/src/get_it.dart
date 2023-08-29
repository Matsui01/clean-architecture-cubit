import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:clean_architecture_cubit/src/utils/resources/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/local/app_database.dart';
import 'data/datasource/remote/orders_service.dart';
import 'data/repositories/orders_repository_impl.dart';
import 'domain/models/token.dart';
import 'domain/repositories/order_repository.dart';
import 'utils/constants/strings.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  getIt.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  dio.interceptors.add(CustomInterceptors());
  dio.options = BaseOptions(baseUrl: baseUrl);
  getIt.registerSingleton<Dio>(dio);

  const secureStorage = FlutterSecureStorage();
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

  getIt.registerSingleton<Token>(Token());

  getIt.registerSingleton<OrdersService>(
    OrdersService(getIt<Dio>()),
  );

  getIt.registerSingleton<OrderRepository>(
    OrdersRepositoryImpl(getIt<AppDatabase>()),
  );
}
