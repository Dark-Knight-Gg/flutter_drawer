import '../repository/app_repository.dart';
import 'usecase.dart';

class InitCacheUseCase extends NoParamsUseCase<void> {
  final AppRepository initRepository;

  InitCacheUseCase(this.initRepository);

  @override
  Future<void> execute() async {
    await initRepository.initCache();
  }
}
