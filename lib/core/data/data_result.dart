abstract class DataResult<T> {}

class Success<T> extends DataResult<T> {
  final T data;

  Success(this.data);
}

class Failed<T> extends DataResult<T> {
  final String message;

  Failed(this.message);
}

class Loading<T> extends DataResult<T> {}