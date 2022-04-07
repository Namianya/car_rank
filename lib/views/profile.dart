import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 150,
          ),
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('${_user!.photoURL}'),
          ),
          const SizedBox(
            height: 40,
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
                      '${_user.displayName}',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          // color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_user.email}',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'email',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          // color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            icon: const Icon(Icons.logout),
            label: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
