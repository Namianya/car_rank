import 'package:car_rank/providers/all_cars_provider.dart';
import 'package:car_rank/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _allCarsProvider = ref.watch(allCarsProvider);

    return Scaffold(
      body: ListView(
        children: _allCarsProvider.when(
          data: (data) => data
              .map((car) => HomeCard(
                    car: car,
                  ))
              .toList(),
          error: (Object error, StackTrace? stackTrace) =>
              [Text('err: $error')],
          loading: () => [const Center(child: CircularProgressIndicator())],
        ),
      ),
    );
  }
}
