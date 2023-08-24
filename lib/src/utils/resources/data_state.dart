import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(super.data, super.error);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(super.data, super.error);
}
