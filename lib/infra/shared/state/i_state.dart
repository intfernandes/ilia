import 'package:ilia/infra/exceptions/exceptions.dart';

abstract class IState {}

class InitialState implements IState {}

class LoadingState implements IState {}

class SuccessState<R> implements IState {
  const SuccessState({
    required this.data,
  });

  final R data;
}

class ErrorState<T extends IException> implements IState {
  const ErrorState({
    required this.exception,
  });

  final T exception;
}
