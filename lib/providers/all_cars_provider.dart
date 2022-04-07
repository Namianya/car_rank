import 'package:car_rank/logic/models/car_model.dart';
import 'package:car_rank/logic/store/store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Store _store = Store();
final allCarsProvider = StreamProvider<List<CarModel>>((ref) async* {
  yield* _store.getAllCars;
});