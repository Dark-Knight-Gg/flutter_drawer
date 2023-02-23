import 'package:equatable/equatable.dart';

class HomeState extends Equatable{
  final bool isActive;

  const HomeState({this.isActive = false});

  HomeState copyWith({
    bool? isActive,
  }) {
    return HomeState(isActive: isActive ?? this.isActive);
  }

  @override
  List<Object?> get props => [isActive];

}