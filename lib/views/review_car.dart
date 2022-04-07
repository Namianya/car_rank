import 'dart:math';

import 'package:car_rank/logic/models/accessories.dart';
import 'package:car_rank/logic/models/car_model.dart';
import 'package:car_rank/logic/models/electricals.dart';
import 'package:car_rank/logic/models/engine_model.dart';
import 'package:car_rank/logic/models/interior.dart';
import 'package:car_rank/logic/models/stearing.dart';
import 'package:car_rank/logic/models/transmission.dart';
import 'package:car_rank/providers/change_step_provider.dart';
import 'package:car_rank/providers/slider_change_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

CollectionReference allCarsCollection =
    FirebaseFirestore.instance.collection('allCars');

class ReviewCar extends ConsumerWidget {
  const ReviewCar({Key? key}) : super(key: key);
  // static const routeName = '/review_car';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as CarModel;
    final _stepsProvider = ref.watch(stepsProvider);
    final _sliderChangeProvider = ref.watch(sliderChangeProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stepper(
                    currentStep: _stepsProvider.step,
                    onStepContinue: () => {
                      if (_stepsProvider.step < 8)
                        {
                          _stepsProvider.nextStep(),
                          _sliderChangeProvider.currentValue = 0,
                        }
                    },
                    onStepCancel: () => _stepsProvider.prevStep(),
                    steps: [
                      reviewSteps(
                        title: 'Engine Rating ',
                        change: _sliderChangeProvider,
                        id: args.id,
                        rattingName: 'engineRating',
                        context: context,
                        options: engineModelList(),
                      ),
                      reviewSteps(
                        title: 'Transmission Rating ',
                        change: _sliderChangeProvider,
                        id: args.id,
                        rattingName: 'transmissionRating',
                        context: context,
                        options: transmission(),
                      ),
                      reviewSteps(
                        title: 'Accesories',
                        change: _sliderChangeProvider,
                        id: args.id,
                        rattingName: 'accessoriesRating',
                        context: context,
                        options: accesories(),
                      ),
                      reviewSteps(
                        context: context,
                        title: 'Stearing Rating',
                        change: _sliderChangeProvider,
                        id: args.id,
                        rattingName: 'stearing',
                        options: stearing(),
                      ),
                      reviewSteps(
                        title: 'electrical Rating',
                        change: _sliderChangeProvider,
                        context: context,
                        id: args.id,
                        rattingName: 'electricRating',
                        options: electricals(),
                      ),

                      reviewSteps(
                        title: 'interior Rating',
                        change: _sliderChangeProvider,
                        id: args.id,
                        rattingName: 'interiorRating',
                        context: context,
                        options: interior(),
                      ),
                      // reviewSteps(
                      //   title: 'accessories Rating',
                      //   current: args.engineRating.toDouble(),
                      //   change: _sliderChangeProvider,
                      //   id: args.id,
                      //   rattingName: 'accessoriesRating',
                      // ),
                      // reviewSteps(
                      //   title: 'tireCondition Rating',
                      //   current: args.engineRating.toDouble(),
                      //   change: _sliderChangeProvider,
                      //   id: args.id,
                      //   rattingName: 'tireConditionRating',
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Done'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Step reviewSteps({
    required String title,
    required SliderChange change,
    required String rattingName,
    required String id,
    required List<String> options,
    required BuildContext context,
  }) {
    return Step(
        title: Text(
          title,
        ),
        content: Column(
            children: options
                .map(
                  (e) => ColumnWidget(
                    optionTitle: e,
                    id: id,
                    rattingName: rattingName,
                  ),
                )
                .toList()));
  }
}

class ColumnWidget extends StatefulWidget {
  const ColumnWidget({
    Key? key,
    required this.optionTitle,
    required this.id,
    required this.rattingName,
  }) : super(key: key);
  final String optionTitle;
  final String id;
  final String rattingName;

  @override
  State<ColumnWidget> createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  int change = 0;

  void _incrementCounter() {
    setState(() {
      change++;
    });
  }

  void _decrementCounter() {
    setState(() {
      change--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.optionTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          child: Slider(
            autofocus: true,
            label: '$change/5',
            value: change.toDouble(),
            max: 5,
            divisions: 5,
            onChanged: (value) async => {
              setState(() {
                change = value.toInt();
              }),
              await allCarsCollection.doc(widget.id).update({
                widget.rattingName: {
                  e: value.toInt(),
                }
                // 'engineRating':
              })
            },
          ),
        ),
      ],
    );
  }
}
