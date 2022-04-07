import 'package:car_rank/logic/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference allCarsCollection =
      FirebaseFirestore.instance.collection('allCars');

//  get list of allCars
  Stream<List<CarModel>> get getAllCars {
    return allCarsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CarModel.fromSnapshot(doc);
      }).toList();
    });
  }

  // post new car
  Future<void> postNewCar(CarModel car) async {
    await allCarsCollection.doc(car.id).set(car.toSnapshot());
  }

  // delete car
  Future<void> deleteCar(String id) async {
    await allCarsCollection.doc(id).delete();
  }

  // update car
  Future<void> updateCar(CarModel car) async {
    await allCarsCollection.doc(car.id).update(car.toSnapshot());
  }

  // get car by id
  Stream<CarModel> getCarById(String id) {
    return allCarsCollection.doc(id).snapshots().map((snapshot) {
      return CarModel.fromSnapshot(snapshot);
    });
  }

  // get car by user id
  Stream<List<CarModel>> getCarsByUserId(String userId) {
    return allCarsCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CarModel.fromSnapshot(doc);
      }).toList();
    });
  }
}
