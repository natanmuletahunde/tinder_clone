import 'package:flutter/material.dart';
import 'package:tinder/authenticationScreen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating  App',
      theme: ThemeData.dark().copyWith(
         scaffoldBackgroundColor: Colors.black
      ),
       debugShowCheckedModeBanner:false,
       home:  const LoginScreen() ,
    );
  }
}
