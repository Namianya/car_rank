import 'package:car_rank/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providerConfigs: const [
        // PhoneProviderConfiguration(),
        GoogleProviderConfiguration(
            clientId:
                "269370862689-bmaqb8titjkv5vjj0ltc14805df1rc2c.apps.googleusercontent.com")
      ],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ));
        }),
      ],
    );
  }
}
