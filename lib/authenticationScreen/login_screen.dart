import 'package:flutter/material.dart';
import 'package:tinder/widgets/custom_text_field_widget.dart';
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
              // email 
              CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: 'Email',
                  iconData: Icons.email_outlined,
                  isObscure: false, 
              ),
                 CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: 'Password',
                  iconData: Icons.lock_outline,
                  isObscure: true, 
              )
                
              ],
            ),
        ),
      ),
          
     );
   }
 }