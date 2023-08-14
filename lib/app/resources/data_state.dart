import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? exception;

  DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data): super(data: data);
}

class DataFailure<T> extends DataState<T> {
  DataFailure(DioException exception) : super(exception: exception);
}