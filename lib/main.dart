import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:tinder/authenticationScreen/login_screen.dart';
import 'package:tinder/controllers/authentication_controller.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
Get.put(AuthenticationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Replace MaterialApp with GetMaterialApp
      title: 'Dating App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
