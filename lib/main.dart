import 'package:dicoding_pertama_membuat_aplikasi_flutter/screens/detail_card_screen.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/screens/home_screen.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      routes: {
        '/': (context) => const SplashScreeen(),
        '/home': (context) => const HomeScreen(),
        '/card/detail': (context) => const DetailCardScreen(),
      },
      // home: const SplashScreeen(),
    );
  }
}
