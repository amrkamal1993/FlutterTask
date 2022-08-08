import 'package:floward/src/view/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/di_container/di_container.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await DIContainer(GetIt.instance).allReadyAsync();

  runApp(const FlowardApp());

}

class FlowardApp extends StatelessWidget {
  const FlowardApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}
