import 'package:flutter/material.dart';
import 'package:game_streaming_and_tournament/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          primaryColor: const Color(0xff181818),
          primaryColorDark: const Color(0xff181818),
          scaffoldBackgroundColor: Colors.black87),
      color: const Color(0xff181818),
      home: const HomePage(),
    );
  }
}
