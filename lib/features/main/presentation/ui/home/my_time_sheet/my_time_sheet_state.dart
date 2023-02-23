import 'package:equatable/equatable.dart';

class MyTimeSheetState extends Equatable{
  final bool isActive;

  const MyTimeSheetState({this.isActive = false});

  MyTimeSheetState copyWith({
    bool? isActive,
  }) {
    return MyTimeSheetState(isActive: isActive ?? this.isActive);
  }

  @override
  List<Object?> get props => [isActive];

}