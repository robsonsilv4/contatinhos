import 'package:flutter/material.dart';

import 'data/providers/remote_provider.dart';
import 'data/repositories/user_repository.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contatinhos',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: HomeScreen(
          repository: UserRepository(
            RemoteProvider(),
          ),
        ),
      ),
    );
  }
}
