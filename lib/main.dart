import 'package:flutter/material.dart';
import 'package:healthcare/view/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

Future<void> initialServices() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const HomePage()},
      initialRoute: '/',
    );
  }
}
