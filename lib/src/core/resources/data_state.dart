abstract class DataState<T> {
  final T? data;
  final String? message;
  final int? code;

  const DataState({this.data, this.message, this.code});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required String super.message, super.code});
}
