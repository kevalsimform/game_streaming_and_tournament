import 'package:flutter/material.dart';
import 'package:game_streaming_and_tournament/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          primaryColor: Color(0xff181818),
          primaryColorDark: Color(0xff181818),
          scaffoldBackgroundColor: Colors.black87),
      color: Color(0xff181818),
      home: const HomePage(),
    );
  }
}
