import 'package:car_rank/logic/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeCard extends StatelessWidget {
  final CarModel car;
  final String? route;
  const HomeCard({Key? key, required this.car, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat("###.0#", "en_US");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, route ?? '/car_details',
                arguments: car);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: car.id,
                child: Image.network(
                  car.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.userName,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        Text(
                          'Seller',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ksh ${car.price}',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        Text(
                          'Price',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          car.model,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        Text(
                          'model',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
