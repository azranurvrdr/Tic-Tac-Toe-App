import 'package:flutter/material.dart';
import 'package:game_app_ttt/Rules.dart';

import 'TicTacToe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade700,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade800, //AppBarın rengi gri
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(
            color: Colors.white, //AppBarın yazısı beyaz
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TicTacToe()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
              ),

              child: const Text(
                "Play Game",
                style: TextStyle(color: Colors.white), //Butonun yazısı beyaz
              ),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RulesPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
              ),

              child: const Text(
                "Rules Page",
                style: TextStyle(color: Colors.white), //Butonun yazısı beyaz
              ),
            ),

          ],
        ),
      ),
    );
  }
}