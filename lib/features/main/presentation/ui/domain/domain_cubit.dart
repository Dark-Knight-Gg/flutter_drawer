import 'package:facexpress/core/core.dart';
import 'package:facexpress/features/routes.dart';
import 'package:facexpress/generated/l10n.dart';

import '../../../domain/usecase/fetch_domain_usecase.dart';
import '../../states/email_input.dart';
import '../login/login_params.dart';
import 'domain_state.dart';

class DomainCubit extends BaseCubit<DomainState> {
  final FetchDomainUsecase fetchDomainUsecase;

  DomainCubit(this.fetchDomainUsecase) : super.value(const DomainState());

  @override
  void start() {}

  void onEmailChange(String email) {
    final newValue = state.value.copyWith(email: EmailInput.dirty(email));
    emit(state.copyWith(value: newValue, message: ''));
  }

  Future<void> onNextClick() async {
    final email = state.value.emailValue;
    showProgress();
    fetchDomainUsecase.execute(email).then((value) {
      hideProgress();
      _navigateToLogin(email, value.logoUrl);
    }).catchError((e) {
      hideProgress();
      emit(state.copyWith(message: BS.current.email_invalid));
    });
  }

  void _navigateToLogin(String email, String logoUrl) {
    final params = LoginParams(email: email, logoUrl: logoUrl);
    final event = NavigateEvent.popAndPushNamed(
      Routes.login.path,
      arguments: params,
    );
    emitNewEvent(event);
  }
}
