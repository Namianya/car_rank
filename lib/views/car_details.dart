import 'package:car_rank/logic/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarDetails extends ConsumerWidget {
  const CarDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as CarModel;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Car Details'),
      // ),
      body: Column(
        children: [
          Hero(
            tag: args.id,
            child: Image.network(
              args.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(args.name, 'Car Name', context),
                      _detailCOntainer(args.model, 'Car Model', context),
                      // _detailCOntainer(
                      //     args.ratting().toString(), 'Car Score', context),
                      _detailCOntainer(args.price, 'Car Price', context),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(args.userName, 'Seller Name', context),
                      _detailCOntainer(args.userEmail, 'Seller email', context),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Rattings',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(args.year.toString(), 'Year', context),
                      _detailCOntainer(
                          args.mileage.toString(), 'milage', context),
                      _detailCOntainer(args.color.toString(), 'Color', context),
                      _detailCOntainer(args.fuel.toString(), 'Fuel', context),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Engine',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(args.engineRating.noises.toString(),
                          'Noises', context),
                      _detailCOntainer(
                          args.engineRating.knock.toString(), 'knock', context),
                      _detailCOntainer(args.engineRating.idling.toString(),
                          'idling', context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(
                          args.engineRating.hoses.toString(), 'Hoses', context),
                      _detailCOntainer(args.engineRating.efficiency.toString(),
                          'efficiency', context),
                      _detailCOntainer(args.engineRating.corrotion.toString(),
                          'corrotion', context),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Transmission',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(
                          args.transmissionRating.automaticTransmission
                              .toString(),
                          'Automatic Tr',
                          context),
                      _detailCOntainer(args.transmissionRating.axels.toString(),
                          'Axles', context),
                      _detailCOntainer(
                          args.transmissionRating.cableClutchLickage.toString(),
                          'clutch link',
                          context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(
                          args.transmissionRating.clutch.toString(),
                          'clutch',
                          context),
                      _detailCOntainer(
                          args.transmissionRating.clutchMasterCilinder
                              .toString(),
                          'master cylinder',
                          context),
                      _detailCOntainer(
                          args.transmissionRating.difrential.toString(),
                          'difrential',
                          context),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Electrical',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(args.electricRating.altonator.toString(),
                          'altonator', context),
                      _detailCOntainer(args.electricRating.battery.toString(),
                          'battery', context),
                      _detailCOntainer(
                          args.electricRating.headLights.toString(),
                          'headLights',
                          context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _detailCOntainer(
                          args.electricRating.harzardLights.toString(),
                          'harzardLights',
                          context),
                      _detailCOntainer(
                          args.electricRating.indicators.toString(),
                          'indicators',
                          context),
                      _detailCOntainer(
                          args.electricRating.parkingLights.toString(),
                          'parkingLights',
                          context),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _detailCOntainer(String value, String title, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.caption?.copyWith(
              // color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
