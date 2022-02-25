import 'package:blocpatten/apicalling_cubit/modal/cricket_modal.dart';
import 'package:blocpatten/apicalling_cubit/modal/failure_modal.dart';
import 'package:equatable/equatable.dart';

abstract class CricketFetchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CricketFetchInitial extends CricketFetchState {}

class CricketFetchLoading extends CricketFetchState {
  @override
  List<Object?> get props => [];
}

class CricketFetchLoaded extends CricketFetchState {
  final Cricket cricketList;

  CricketFetchLoaded({required this.cricketList});
  // HomeSuccess({required this.news});
  @override
  List<Object?> get props => [cricketList];
}

class CricketFetchError extends CricketFetchState {
  final Failuer failuer;

  CricketFetchError({required this.failuer});
  @override
  List<Object?> get props => [];
}
