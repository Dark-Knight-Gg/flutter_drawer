import 'package:equatable/equatable.dart';

class PinCodeState extends Equatable {
  final bool isActive;

  const PinCodeState({this.isActive = false});

  PinCodeState copyWith({
    bool? isActive,
  }) {
    return PinCodeState(isActive: isActive ?? this.isActive);
  }

  @override
  List<Object?> get props => [isActive];
}
