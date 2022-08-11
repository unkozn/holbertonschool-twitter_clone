// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/app_state.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/signin_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA3jQbp7x3qE1xRSxMqfTDbIcUk59s2umY", // Your apiKey
      appId: "1:1069444769290:android:a3db086319ce6ce92fe1f3", // Your appId
      messagingSenderId: "1069444769290", // Your messagingSenderId
      projectId: "clone-twitter-d9475", // Your projectId
    ),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppState()),
      ChangeNotifierProvider(create: (_) => Auth())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}