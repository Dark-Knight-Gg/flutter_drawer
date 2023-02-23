import 'package:flutter/material.dart';

import '../bloc/view_state.dart';
import '../configs/constants_widget.dart';

class MultiStateViewWidget extends StatelessWidget {
  final Widget child;
  final ViewState? viewState;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final String? message;
  final VoidCallback? onRetryPress;

  const MultiStateViewWidget({
    super.key,
    required this.child,
    this.viewState,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.message,
    this.onRetryPress,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewState ?? ViewState.content) {
      case ViewState.content:
        return child;
      case ViewState.loading:
        return loadingWidget ?? defaultLoadingWidget();
      case ViewState.empty:
        return emptyWidget ?? defaultEmptyWidget();
      case ViewState.error:
        return errorWidget ?? defaultErrorWidget();
    }
  }

  Widget defaultLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget defaultEmptyWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 32,
            color: Colors.amber,
          ),
          height12,
          Text(
            message ?? 'Data not found!',
            textAlign: TextAlign.center,
          ),
          height5,
          onRetryPress == null
              ? emptyView
              : TextButton(onPressed: onRetryPress, child: const Text("Retry"))
        ],
      ),
    );
  }

  Widget defaultErrorWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline_sharp,
            size: 32,
            color: Colors.red,
          ),
          height12,
          Text(
            message ?? 'Something went wrong!',
            textAlign: TextAlign.center,
          ),
          height5,
          onRetryPress == null
              ? emptyView
              : TextButton(onPressed: onRetryPress, child: const Text("Retry"))
        ],
      ),
    );
  }
}
