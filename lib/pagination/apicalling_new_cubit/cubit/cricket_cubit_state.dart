import 'package:blocpatten/pagination/apicalling_new_cubit/modal/pagination_modal.dart';
import 'package:equatable/equatable.dart';

abstract class PaginationCubitState extends Equatable {
  // final List<Item> items;
  //
  // PaginationCubitState({
  //   this.items = const [],
  // });
  //

  @override
  List<Object?> get props => [];
}

class PaginationInitailState extends PaginationCubitState {}

class PaginationLoadingState extends PaginationCubitState {
  final String? massage;

  PaginationLoadingState({
    required this.massage,
  });

  @override
  List<Object?> get props => [massage];
}

class PaginationLoadedtState extends PaginationCubitState {
  // final List<Item> items;
  //
  // PaginationLoadedtState({
  //   required this.items,
  // }) : super(items: items);
  //
  // @override
  // List<Object?> get props => [items];

  final Pagination pagination;
  final bool isloading;

  PaginationLoadedtState({
    this.isloading = false,
    required this.pagination,
  });

  @override
  List<Object?> get props => [pagination];
}

class PaginationErrorState extends PaginationCubitState {
  final String? massage;

  PaginationErrorState({
    required this.massage,
  });

  @override
  List<Object?> get props => [];
}
