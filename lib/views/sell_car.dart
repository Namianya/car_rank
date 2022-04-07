import 'package:car_rank/providers/all_cars_provider.dart';
import 'package:car_rank/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SellCar extends ConsumerWidget {
  const SellCar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _allCarsProvider = ref.watch(allCarsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sell Car'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: _allCarsProvider.when(
                    data: (data) => data
                        .map((car) => HomeCard(
                              car: car,
                              route: '/review_car',
                            ))
                        .toList(),
                    error: (Object error, StackTrace? stackTrace) =>
                        [Text('err: $error')],
                    loading: () => [Text('loading')],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create_car');
                      },
                      icon: const Icon(Icons.sell_outlined),
                      label: const Text('Post Car'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
