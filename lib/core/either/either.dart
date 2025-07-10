typedef Callback<T> = void Function(T value);

abstract class Either<L, R> {
  Either() {
    if (!isLeft && !isRight) {
      throw Exception('The ether should be heir Left or Right.');
    }
  }

  bool get isLeft => this is Left<L, R>;

  bool get isRight => this is Right<L, R>;

  L get left {
    if (this is Left<L, R>) {
      return (this as Left<L, R>).failure;
    } else {
      throw Exception('Illegal use. You should check isLeft() before calling ');
    }
  }

  R get right {
    if (this is Right<L, R>) {
      return (this as Right<L, R>).value;
    } else {
      throw Exception('Illegal use. You should check isRight() before calling');
    }
  }

  void either(Callback<L> failure, Callback<R> value) {
    if (isLeft) {
      final left = this as Left<L, R>;
      failure(left.failure);
    }

    if (isRight) {
      final right = this as Right<L, R>;
      value(right.value);
    }
  }
}

class Left<L, R> extends Either<L, R> {
  final L failure;

  Left(this.failure);
}

class Right<L, R> extends Either<L, R> {
  final R value;

  Right(this.value);
}
