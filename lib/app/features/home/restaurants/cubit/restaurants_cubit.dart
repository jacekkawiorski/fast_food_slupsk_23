import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food_slupsk_23/app/features/home/restaurants/restaurants_page_content.dart';
import 'package:meta/meta.dart';

part 'retaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit()
      : super(
          const RestaurantsState(
            documents: [],
            errorMsg: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const RestaurantsState(
        documents: [],
        errorMsg: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection("restaurants")
        .orderBy('rating', descending: true)
        .snapshots()
        .listen(
      (data) {
        emit(
          RestaurantsState(
            documents: data.docs,
            isLoading: false,
            errorMsg: '',
          ),
        );
      },
    )..onError((error) {
        emit(
          RestaurantsState(
            documents: [],
            isLoading: false,
            errorMsg: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
