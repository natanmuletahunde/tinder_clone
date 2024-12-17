import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/authenticationScreen/registration_screen.dart';
import 'package:tinder/widgets/custom_text_field_widget.dart';
 class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});
 
   @override
   State<LoginScreen> createState() => _LoginScreenState();
 } 
 
 class _LoginScreenState extends State<LoginScreen> {

    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();
    bool showProgressBar = false;
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
                  const SizedBox(height:10),
              // email 
              SizedBox(
                width: MediaQuery.of(context).size.width -40,
                height: 55,
                child: CustomTextFieldWidget(
                    editingController: emailTextEditingController,
                    labelText: 'Email',
                    iconData: Icons.email_outlined,
                    isObscure: false, 
                ),
              ),
              const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width -40,
                  height: 55,
                   child: CustomTextFieldWidget(
                    editingController: passwordTextEditingController,
                    labelText: 'Password',
                    iconData: Icons.lock_outline,
                    isObscure: true, 
                                 ),
                 ),
                 const SizedBox( height: 10,),

            Container(
              width: MediaQuery.of(context).size.width - 36,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12)
                )
              ),
              child: InkWell(
                onTap: (){

                },
               child:const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
               ),
              
              ),
              
            ),
            const SizedBox(height: 10,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
                 const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                  ),
                 ),
                 InkWell(
                  onTap: () {
                 Get.to(RegistrationScreen());
                  },
                  child:  const Text(
                    'Create Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                 )
             ],
            ) ,
            showProgressBar == true ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            )
            :Container(),   
              ],
            ),
        ),
      ),
          
     );
   }
 }