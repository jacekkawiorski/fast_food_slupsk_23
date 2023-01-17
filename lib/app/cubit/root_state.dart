part of 'root_cubit.dart';

@immutable
class RootState {
  final User? user;
  final bool isLoading;
  final String errorMsg;

  const RootState({
    required this.user,
    required this.isLoading,
    required this.errorMsg,
  });
}
