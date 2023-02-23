import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/base_bloc.dart';
import '../bloc/state_wrapper.dart';
import '../logger/app_logger.dart';
import '../navigation/navigate_event.dart';
import '../navigation/navigator_helper.dart';
import '../progress/progress_event.dart';
import '../progress/progress_helper.dart';
import '../toast/toast_event.dart';
import '../toast/toast_helper.dart';
import 'multi_state_view_widget.dart';

export '../bloc/state_wrapper.dart';

abstract class BaseStatelessWidget<V, C extends BaseCubit<V>>
    extends StatelessWidget with Page<V, C> {
  const BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) => buildRoot();
}

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

class BaseStatefulWidgetState<V, C extends BaseCubit<V>>
    extends State<BaseStatefulWidget> with Page<V, C> {
  @override
  Widget build(BuildContext context) => buildRoot();
}

abstract class Page<V, C extends BaseCubit<V>> {
  void handleListener(BuildContext context, StateWrapper<V> state) {
    AppLogger.log('$runtimeType: handleListener, $state');
    var event = state.event;
    if (event is NavigateEvent) {
      NavigatorHelper.navigate(event, (response) {
        cubit(context).onEventResult(event, response);
      });
      return;
    }
    if (event is ToastEvent) {
      var toast = FToast().init(context);
      ToastHelper.showToast(toast, event);
      return;
    }
    if (event is ProgressEvent) {
      ProgressHelper.handleProgressDialog(context, event);
      return;
    }
  }

  Widget buildRoot() {
    return BlocConsumer<C, StateWrapper<V>>(
      listenWhen: (previous, current) => previous.event != current.event,
      listener: handleListener,
      buildWhen: (previous, current) =>
          previous.viewState != current.viewState ||
          previous.message != current.message ||
          previous.value != current.value,
      builder: buildMain,
    );
  }

  Widget buildMain(BuildContext context, state) {
    AppLogger.log('$runtimeType: buildMain, $state');
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: backgroundColor(),
        body: buildBody(context, state),
      ),
    );
  }

  Future<bool> onWillPop() async => true;

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget buildBody(BuildContext context, StateWrapper<V> state) {
    return MultiStateViewWidget(
      viewState: state.viewState,
      loadingWidget: buildLoading(state),
      emptyWidget: buildEmpty(state),
      errorWidget: buildError(state),
      message: message(state),
      onRetryPress: onRetryPress(context),
      child: buildContent(context, state),
    );
  }

  Widget buildContent(BuildContext context, StateWrapper<V> state) {
    return Center(child: Text("New screen $runtimeType"));
  }

  Widget? buildLoading(StateWrapper<V> state) => null;

  Widget? buildEmpty(StateWrapper<V> state) => null;

  Widget? buildError(StateWrapper<V> state) => null;

  String? message(StateWrapper<V> state) => null;

  VoidCallback? onRetryPress(BuildContext context) =>
      () => cubit(context).refresh();

  Color? backgroundColor() => Colors.white;

  C cubit(BuildContext context) => context.read<C>();
}
