import 'package:car_rank/providers/auth_change_provider.dart';
import 'package:car_rank/views/auth_wrapper.dart';
import 'package:car_rank/views/car_details.dart';
import 'package:car_rank/views/create_car.dart';
import 'package:car_rank/views/home.dart';
import 'package:car_rank/views/login.dart';
import 'package:car_rank/views/review_car.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authStreamProvider = ref.watch(authStreamProvider).value;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      // initialRoute: '/',
      // onGenerateRoute: (settings) => {
      //   settings.name
      // },
      home: const AuthWrapper(),
      routes: {
        '/Home': (BuildContext context) => const Home(),
        '/profile': (BuildContext context) => const Home(),
        '/login': (BuildContext context) => const Login(),
        '/car_details': (BuildContext context) => const CarDetails(),
        '/auth_wrapper': (BuildContext context) => const AuthWrapper(),
        '/create_car': (BuildContext context) => const CreateCar(),
        '/review_car': (_) => const ReviewCar(),
      },
    );
  }
}
