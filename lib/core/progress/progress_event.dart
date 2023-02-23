enum ProgressType { show, hide }

class ProgressEvent {
  final bool dismissible;
  final ProgressType type;

  ProgressEvent._(this.dismissible, this.type);

  ProgressEvent.show({bool dismissible = false})
      : this._(dismissible, ProgressType.show);

  ProgressEvent.hide({bool dismissible = false})
      : this._(dismissible, ProgressType.hide);

  @override
  String toString() {
    return 'ProgressEvent{dismissible: $dismissible, type: $type}';
  }
}
