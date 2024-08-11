part of '../cubits/saved_cubit.dart';

sealed class SavedCubitState extends Equatable {
  const SavedCubitState();

  @override
  List<Object> get props => [];
}

final class SavedCubitInitial extends SavedCubitState {}
