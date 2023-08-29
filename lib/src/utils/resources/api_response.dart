// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'api_error.dart';

abstract class ApiResponse<T> {
  final T? data;
  final AppError? error;

  const ApiResponse({
    this.data,
    this.error,
  });
}

class ApiSuccess<T> extends ApiResponse<T> {
  const ApiSuccess(T data) : super(data: data);
}

class ApiError<T> extends ApiResponse<T> {
  const ApiError(AppError error) : super(error: error);
}
