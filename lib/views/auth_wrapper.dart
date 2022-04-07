import 'package:car_rank/providers/auth_change_provider.dart';
import 'package:car_rank/providers/navigation_index_provider.dart';
import 'package:car_rank/views/home.dart';
import 'package:car_rank/views/login.dart';
import 'package:car_rank/views/profile.dart';
import 'package:car_rank/views/sell_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _navigationIndexProvider = ref.watch(navigationIndexProvider);
    final _authStreamProvider = ref.watch(authStreamProvider);
    // return _authStreamProvider!=null?const Home():const Login();
    const List<Widget> _widgetOptions = <Widget>[
      Home(),
      SellCar(),
      Profile(),
    ];
    return _authStreamProvider.when(
        data: (data) => data?.uid != null
            ? Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.sell),
                      label: 'Sell',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'My Profile',
                    ),
                  ],
                  currentIndex: _navigationIndexProvider.index,
                  onTap: (value) => _navigationIndexProvider.index = value,
                ),
                body: _widgetOptions.elementAt(_navigationIndexProvider.index),
              )
            : const Login(),
        loading: () {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        error: (Object error, StackTrace? stackTrace) {
          return Scaffold(
            body: Center(
              child: Text('err: $error'),
            ),
          );
        });
  }
}
