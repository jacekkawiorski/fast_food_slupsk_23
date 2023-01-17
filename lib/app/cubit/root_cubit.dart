import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(
          const RootState(
            user: null,
            isLoading: false,
            errorMsg: '',
          ),
        );

  StreamSubscription? _streamsubscription;

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> start() async {
    emit(
      const RootState(
        user: null,
        isLoading: true,
        errorMsg: '',
      ),
    );

    _streamsubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        RootState(
          user: user,
          isLoading: false,
          errorMsg: '',
        ),
      );
    })
          ..onError(
            (error) {
              emit(
                RootState(
                  user: null,
                  isLoading: false,
                  errorMsg: error.toString(),
                ),
              );
            },
          );
  }

  @override
  Future<void> close() {
    _streamsubscription?.cancel();
    return super.close();
  }
}
