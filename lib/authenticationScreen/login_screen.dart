import 'package:flutter/material.dart';
 class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});
 
   @override
   State<LoginScreen> createState() => _LoginScreenState();
 } 
 
 class _LoginScreenState extends State<LoginScreen> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                const SizedBox(height: 120),
               Image.asset(
                'images/logo.png',
                width:200,
               ),
               Text(
                'Welcome',
                style: TextStyle(
                  
                ),
               )
              ],
            ),
        ),
      ),
          
     );
   }
 }