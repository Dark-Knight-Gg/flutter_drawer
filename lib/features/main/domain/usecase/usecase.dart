abstract class BaseUseCase<R> {
  const BaseUseCase();
}

abstract class UseCase<P, R> extends BaseUseCase<R> {
  Future<R> execute(P params);
}

abstract class NoParamsUseCase<R> extends BaseUseCase<R> {
  const NoParamsUseCase() : super();

  Future<R> execute();
}
