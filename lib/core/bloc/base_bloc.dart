import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../progress/progress_event.dart';
import 'state_wrapper.dart';
import 'view_state.dart';

abstract class BaseCubit<V> extends Cubit<StateWrapper<V>> {
  BaseCubit.create(super.initialState) {
    start();
  }

  BaseCubit.value(V value) : this.create(StateWrapper<V>(value: value));

  ViewState? get viewState => state.viewState;

  String? get message => state.message;

  V get value => state.value;

  dynamic get event => state.event;

  void start() {}

  void refresh() => start();

  void onEventResult(dynamic event, dynamic response) {}

  Future<void> doWithProgress(FutureOr<void> Function() block) async {
    showProgress();
    await block();
    hideProgress();
  }

  void emitNewValue(V value) {
    emit(state.copyWith(value: value));
  }

  void emitNewEvent(dynamic event) {
    emit(state.copyWith(event: event));
  }

  void emitNewMessage(String? message) {
    emit(state.copyWith(message: message));
  }

  void showContent(V? value, String? message) {
    final newState = state.copyWith(
      viewState: ViewState.content,
      value: value,
      message: message,
    );
    emit(newState);
  }

  void showLoading() {
    final newState = state.copyWith(viewState: ViewState.loading);
    emit(newState);
  }

  void showEmpty(String? message) {
    final newState = state.copyWith(
      viewState: ViewState.empty,
      message: message,
    );
    emit(newState);
  }

  void showError(String? message) {
    final newState = state.copyWith(
      viewState: ViewState.error,
      message: message,
    );
    emit(newState);
  }

  void showProgress() {
    emit(state.copyWith(event: ProgressEvent.show()));
  }

  void hideProgress() {
    emit(state.copyWith(event: ProgressEvent.hide()));
  }
}
