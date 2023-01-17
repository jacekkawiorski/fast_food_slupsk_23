import 'package:fast_food_slupsk_23/app/features/home/restaurants/cubit/restaurants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantsPageCcontent extends StatelessWidget {
  const RestaurantsPageCcontent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantsCubit()..start(),
      child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state.errorMsg.isNotEmpty) {
            return Center(
              child: Text(
                'Wystąpił jakiś błąd ${state.errorMsg}',
              ),
            );
          }
          if (state.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = state.documents;
          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(document['name']),
                          Text(document['food']),
                        ],
                      ),
                      Text(document['rating'].toString()),
                    ],
                  ),
                ),
              ],
            ],
          );

          // asdasdasd
        },
      ),
    );
  }
}
