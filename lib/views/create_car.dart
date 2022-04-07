import 'package:car_rank/logic/models/accessories.dart';
import 'package:car_rank/logic/models/car_model.dart';
import 'package:car_rank/logic/models/electricals.dart';
import 'package:car_rank/logic/models/engine_model.dart';
import 'package:car_rank/logic/models/interior.dart';
import 'package:car_rank/logic/models/stearing.dart';
import 'package:car_rank/logic/models/transmission.dart';
import 'package:car_rank/logic/store/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCar extends ConsumerWidget {
  const CreateCar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _nameController = TextEditingController(),
        _modelController = TextEditingController(),
        _priceController = TextEditingController(),
        _colorController = TextEditingController(),
        _yearController = TextEditingController(),
        _fuelController = TextEditingController(),
        _mailageController = TextEditingController(),
        _descriptionController = TextEditingController(),
        _imageController = TextEditingController(),
        _idController = TextEditingController();
    final _user = FirebaseAuth.instance.currentUser;
    Store _store = Store();

    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 'car_image',
            child: Image.network(
              'https://images.unsplash.com/photo-1642709249513-3ac917e43dca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _idController,
                    decoration: const InputDecoration(
                      labelText: 'Car Plate No.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _imageController,
                    decoration: const InputDecoration(
                      labelText: 'Car Image url',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Car Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _modelController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Car Model',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _colorController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Car Color',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Car Price in KSH',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Car Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _fuelController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Car Fuel',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _yearController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Manufature Year',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _mailageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Milage',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
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
                  primary: Colors.red,
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    _store
                        .postNewCar(CarModel(
                          color: _colorController.text,
                          description: _descriptionController.text,
                          fuel: _fuelController.text,
                          image: _imageController.text,
                          name: _nameController.text,
                          model: _modelController.text,
                          price: _priceController.text,
                          year: _yearController.text,
                          mileage: _mailageController.text,
                          accessoriesRating: Accesories(
                            afterMarketAccesories: 0,
                            airbags: 0,
                            cigaretteLighter: 0,
                            horn: 0,
                            radio: 0,
                            speackers: 0,
                            television: 0,
                            washerBumper: 0,
                            wipperMotor: 0,
                          ),
                          electricRating: Electricals(
                            altonator: 0,
                            battery: 0,
                            dashboard: 0,
                            fogLihts: 0,
                            harzardLights: 0,
                            headLights: 0,
                            indicators: 0,
                            interorLights: 0,
                            oilPressureSwitch: 0,
                            parkingLights: 0,
                            rearFogLights: 0,
                            starter: 0,
                            tail: 0,
                            temperatureGauge: 0,
                          ),
                          engineRating: EngineModel(
                            belts: 0,
                            compresionTest: 0,
                            corrotion: 0,
                            efficiency: 0,
                            exhaust: 0,
                            hoses: 0,
                            idling: 0,
                            knock: 0,
                            noises: 0,
                            operation: 0,
                            overhauled: 0,
                            powerProducedByEachGear: 0,
                            serviceHistory: 0,
                            steaming: 0,
                          ),
                          interiorRating: Interior(
                            airVents: 0,
                            dashboard: 0,
                            doorHandles: 0,
                            floorCarpet: 0,
                            gloveBox: 0,
                            headrests: 0,
                            roofInterior: 0,
                            seates: 0,
                            visors: 0,
                          ),
                          transmissionRating: Transmission(
                            automaticTransmission: 0,
                            axels: 0,
                            cableClutchLickage: 0,
                            clutch: 0,
                            clutchMasterCilinder: 0,
                            continuousVariableTransmission: 0,
                            difrential: 0,
                            electtronicControlledClutch: 0,
                            leaks: 0,
                            manualTransAxle: 0,
                            manualTransmission: 0,
                            nioses: 0,
                            presureplate: 0,
                            propellerShaft: 0,
                            speedometerDrive: 0,
                            transferBox: 0,
                            transmisionBrake: 0,
                            transmissionHousing: 0,
                          ),
                          id: _idController.text,
                          userEmail: '${_user!.email}',
                          userName: '${_user.displayName}',
                          stearing: Stearing(
                            ballJoints: 0,
                            bushes: 0,
                            cvJointBoot: 0,
                            innerCvJoint: 0,
                            leaks: 0,
                            noises: 0,
                            outerCvJoint: 0,
                            powerStearingPump: 0,
                            stearingBox: 0,
                            steeringRack: 0,
                            steeringWheelPlay: 0,
                            tireRods: 0,
                          ),
                        ))
                        .then((val) => Navigator.pop(context));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                icon: const Icon(Icons.post_add),
                label: const Text('Post'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
