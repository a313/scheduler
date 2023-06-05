abstract class DataState<T> {
  DataState();
}

class DataSuccess<T> extends DataState<T> {
  final T data;

  DataSuccess(this.data);
}

class DataFailure<T> extends DataState<T> {
  final String code;
  final String message;

  DataFailure(this.code, this.message);
}

class IgnoreFailure<T> extends DataState<T> {}
