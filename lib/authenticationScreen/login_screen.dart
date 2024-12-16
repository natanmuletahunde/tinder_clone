import 'package:flutter/material.dart';
 class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});
 
   @override
   State<LoginScreen> createState() => _LoginScreenState();
 } 
 
 class _LoginScreenState extends State<LoginScreen> {

    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();
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
               const  Text(
                'Welcome',
                style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
                ),
               ),
                 const SizedBox(height: 10,),
                const  Text(
                ' Login now to find your best match',
                style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                ),
               ),
                  const SizedBox(height: 120),
                
            
              ],
            ),
        ),
      ),
          
     );
   }
 }